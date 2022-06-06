// MIT License
//
// Copyright (c) 2022 Ian Koerich Maciel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:dart_ewelink_api/src/model/ewelink_device.dart';
import 'package:dart_ewelink_api/src/model/ewelink_error_response.dart';
import 'package:dart_ewelink_api/src/model/ewelink_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:nonce/nonce.dart';

import 'package:dart_ewelink_api/dart_ewelink_api.dart';

class EwelinkService {
  EwelinkService({
    required this.appId,
    required this.appSecret,
    required this.region,
    this.credentials,
  });

  //@visibleForTesting
  http.Client client = http.Client();
  String region;
  final String appSecret;
  final String appId;
  EwelinkCredentials? credentials;
  static const apiVersion = 8;

  Future<EwelinkCredentials> fetchCredentials({
    required email,
    required phoneNumber,
    required password,
  }) async {
    Map<String, dynamic> requestBody = {
      'appid': appId,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'ts': _timestamp,
      'version': apiVersion,
      'nonce': _getNonce,
    };

    Map<String, String> headers = {
      'Authorization': 'Sign ${_makeAuthorizationSign(appSecret, requestBody)}',
    };
    http.Response response = await client.post(Uri.parse('$apiUrl/user/login'),
        body: jsonEncode(requestBody), headers: headers);

    // The api always returns status code 200, even when there are errors.
    // If has erros, then the error will be inside the body.
    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    String returnedRegion = '';

    if (EwelinkErrorResponse.hasError(responseBody)) {
      EwelinkErrorResponse error = EwelinkErrorResponse.fromJson(responseBody);

      if (error.code == 400 || error.code == 401 || error.code == 404) {
        throw new EwelinkGenericException('406 Not Acceptable');
      }

      returnedRegion = responseBody['region'] ?? '';
      if (error.code == 301 && returnedRegion.isNotEmpty) {
        if (this.region != returnedRegion) {
          region = returnedRegion;
          return fetchCredentials(
              email: email, password: password, phoneNumber: phoneNumber);
        }
        throw EwelinkGenericException('Region does not exist');
      }
      throw EwelinkGenericException(error.msg);
    }

    credentials = EwelinkCredentials.fromJson(responseBody);
    return credentials!;
  }

  Future<bool> setDevicePowerState({
    required String deviceId,
    required String state,
    channel = 1,
  }) async {
    if (credentials == null) {
      throw EwelinkGenericException('Not logged in');
    }
    // TODO
    // const device = await getDevice(deviceId);
    // const error = _get(device, 'error', false);
    // const uiid = _get(device, 'extra.extra.uiid', false);

    // TODO - fixme
    EwelinkDevice device = await getDevice(deviceId: deviceId);

    int switchesAmount = device.params.switches?.length ?? 1;

    if (switchesAmount > 0 && switchesAmount < channel) {
      throw EwelinkGenericException('error: 404, msg: errors.ch404');
    }

    if (device.params.status == null && device.params.switches == null) {
      throw EwelinkGenericException('error, msg: errors[error]');
    }

    String? initialStatus;
    if (device.params.status != null) {
      initialStatus = device.params.status;
    }
    if (device.params.switches != null) {
      initialStatus = device.params.getSwitchesStatus(channel);
    }

    String stateToSwitch = state;
    Map<String, dynamic> params = {};

    if (state == 'toggle') {
      stateToSwitch = initialStatus == 'on' ? 'off' : 'on';
    }

    if (device?.params.switches != null) {
      params['switches'] = device!.params.switches;
      ((params['switches'])[channel - 1])['switch'] = stateToSwitch;
    } else {
      params['switch'] = stateToSwitch;
    }

    // TODO
    // if (this.devicesCache) {
    //   return ChangeStateZeroconf.set({
    //     url: this.getZeroconfUrl(device),
    //     device,
    //     params,
    //     switches,
    //     state: stateToSwitch,
    //   });
    // }

    Map<String, dynamic> body = {
      'deviceid': deviceId,
      'params': params,
      'appid': appId,
      'nonce': _getNonce,
      'ts': _timestamp,
      'version': apiVersion.toString(),
    };
    await _makeRequest(
      method: 'post',
      urlPath: '/user/device/status',
      body: body,
    );

    return true;
  }

  Future<EwelinkDevice> getDevice({required String deviceId}) async {
    if (credentials == null) {
      throw EwelinkGenericException('Not logged in');
    }
    Map<String, dynamic> queryParameters = {
      'deviceid': deviceId,
      'appid': appId,
      'nonce': _getNonce,
      'ts': _timestamp,
      'version': apiVersion.toString(),
    };
    Map<String, dynamic> response = await _makeRequest(
      urlPath: '/user/device/${deviceId}',
      queryParameters: queryParameters,
    );

    return EwelinkDevice.fromJson(response);
  }

  Future<Map<String, dynamic>> _makeRequest({
    String method = 'get',
    required String urlPath,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> queryParameters = const {},
  }) async {
    if (credentials == null) {
      throw EwelinkGenericException('Not logged in');
    }
    Uri requestUrl = Uri.parse('${apiUrl}${urlPath}');

    Map<String, String> headers = {
      'Authorization': 'Bearer ${credentials!.at}',
      'Content-Type': 'application/json'
    };

    late http.Response response;
    if (method == 'post') {
      response = await client.post(requestUrl,
          headers: headers, body: jsonEncode(body));
    } else {
      Uri getUri = Uri(
        scheme: requestUrl.scheme,
        host: requestUrl.host,
        port: requestUrl.port,
        path: requestUrl.path,
        queryParameters: queryParameters,
      );
      response = await client.get(
        getUri,
        headers: headers,
      );
    }

    Map<String, dynamic> responseObject = jsonDecode(response.body);
    if (EwelinkErrorResponse.hasError(responseObject)) {
      EwelinkErrorResponse error =
          EwelinkErrorResponse.fromJson(jsonDecode(responseObject['msg']));
      if (error.code == 401 &&
          error.errmsg == 'no authorization' &&
          credentials!.at.isNotEmpty) {
        throw EwelinkInvalidAccessToken();
      }
      if (error.code == 401 &&
          error.msg == 'Bearer:accessToken is empty' &&
          credentials!.at.isNotEmpty) {
        throw EwelinkInvalidAccessToken();
      }
      throw EwelinkGenericException(error.errmsg);
    }
    return responseObject;
  }

  String _makeAuthorizationSign(String appSecret, Map<String, dynamic> body) {
    List<int> key = utf8.encode(appSecret);
    List<int> utfBody = utf8.encode(json.encode(body));

    Hmac hmac = Hmac(sha256, key);
    Digest digest = hmac.convert(utfBody);

    return base64.encode(digest.bytes);
  }

  /// Generate eWeLink API URL
  String get apiUrl => 'https://${this.region}-api.coolkit.cc:8080/api';

  String get _getNonce => Nonce.secure(8).toString();
  String get _timestamp =>
      '${(DateTime.now().millisecondsSinceEpoch / 1000).floor()}';
}
