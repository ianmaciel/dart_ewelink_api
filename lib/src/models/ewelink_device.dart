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

import 'package:dart_ewelink_api/src/models/ewelink_device_tags.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'ewelink_device.g.dart';

@JsonSerializable(explicitToJson: true)
class EwelinkDevice {
  EwelinkDevice(
    this.online,
    this.deviceid,
    this.name,
    this.type,
    this.params,
    this.tags,
  );
  bool online;
  String deviceid;
  String name;
  String type;
  EwelinkDeviceParams params;
  EwelinkDeviceTags? tags;

  // let status = _get(device, 'params.switch', false);
  // const switches = _get(device, 'params.switches', false);

  bool get offline => !online;

  factory EwelinkDevice.fromJson(Map<String, dynamic> json) =>
      _$EwelinkDeviceFromJson(json);

  static List<EwelinkDevice> fromJsonList(List<dynamic> json) =>
      json.map((device) => EwelinkDevice.fromJson(device)).toList();

  Map<String, dynamic> toJson() => _$EwelinkDeviceToJson(this);
}
