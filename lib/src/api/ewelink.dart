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

import 'package:dart_ewelink_api/src/api/ewelink_service.dart';
import 'package:dart_ewelink_api/src/ewelink_constants.dart';
import 'package:dart_ewelink_api/src/model/ewelink_exceptions.dart';

import '../model/ewelink_credentials.dart';

class Ewelink {
  Ewelink({
    this.email,
    this.password,
    required this.region,
    this.credentials,
    this.phoneNumber,
    this.arpTable,
    this.devicesCache,
  }) {
    if (!checkLoginParameters()) {
      throw new EwelinkInvalidCredentials();
    }

    _service = EwelinkService(
        appId: appId,
        appSecret: appSecret,
        region: this.region,
        credentials: this.credentials);
  }

  String? email;
  String? password;
  String region;
  EwelinkCredentials? credentials;
  final String appId = EwelinkConstants.DefaultAppID;
  final String appSecret = EwelinkConstants.DefaultAppSecret;
  String? phoneNumber;
  Map<String, dynamic>? arpTable;
  Map<String, dynamic>? devicesCache;
  late EwelinkService _service;

  factory Ewelink.fromToken({
    required EwelinkCredentials credentials,
  }) =>
      Ewelink(credentials: credentials, region: credentials.region);

  factory Ewelink.fromPassword({
    required String email,
    required String password,
    required String region,
  }) =>
      Ewelink(email: email, password: password, region: region);

  // eslint-disable-next-line class-methods-use-this
  checkLoginParameters() {
    if (email != null && phoneNumber != null) {
      return false;
    }

    if ((email != null && password != null) ||
        (phoneNumber != null && password != null) ||
        (devicesCache != null && arpTable != null) ||
        credentials?.at != null) {
      return true;
    }

    return false;
  }

  /// Generate eWeLink OTA API URL
  String get otaUrl => 'https://${this.region}-ota.coolkit.cc:8080/otaother';

  /// Generate eWeLink WebSocket URL
  String get apiWebSocketUrl =>
      'wss://${this.region}-pconnect3.coolkit.cc:8080/api/ws';

  /// enerate Zeroconf URL
  String getZeroconfUrl(String ip) => 'http://$ip:8081/zeroconf';

  /// Returns user credentials information model
  Future<EwelinkCredentials> getCredentials() async {
    credentials = await _service.fetchCredentials(
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
    return credentials!;
  }

  /// Toggle the device
  ///
  /// if [initialStatus] is set, then it whill ignore the current state of
  /// device and will use the [initialStatus] instead. Useful to avoid request
  /// and reduce the latency when you already know the switch state.
  Future<bool> toggleDevice({
    required String deviceId,
    int channel = 1,
    String? initialStatus,
  }) async {
    return setDevicePowerState(
      deviceId: deviceId,
      state: 'toggle',
      channel: channel,
      initialStatus: initialStatus,
    );
  }

  /// Change power state for a specific device
  ///
  /// @param deviceId
  /// @param state
  /// @param channel
  ///
  /// @returns {Promise<{state: *, status: string}|{msg: string, error: *}>}
  Future<bool> setDevicePowerState({
    required String deviceId,
    required state,
    channel = 1,
    String? initialStatus,
  }) async {
    return _service.setDevicePowerState(
      deviceId: deviceId,
      state: state,
      initialStatus: initialStatus,
    );
  }

  /// Get information for a specific device
  ///
  /// @param deviceId
  /// @returns {Promise<*|null|{msg: string, error: *}>}
  getDevice({required String deviceId}) async {
    // TODO
    // if (this.devicesCache) {
    //   return this.devicesCache.find(dev => dev.deviceid === deviceId) || null;
    // }
    return _service.getDevice(
      deviceId: deviceId,
    );
  }
}
