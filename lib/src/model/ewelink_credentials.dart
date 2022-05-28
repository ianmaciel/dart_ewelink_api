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

import 'package:json_annotation/json_annotation.dart';

import 'ewelink_user.dart';

part 'ewelink_credentials.g.dart';

@JsonSerializable(explicitToJson: true)
class EwelinkCredentials {
  EwelinkCredentials(this.at, this.rt, this.region, this.user);
  @JsonKey(name: 'at')
  String at;
  @JsonKey(name: 'rt')
  String rt;
  String region;
  EwelinkUser user;

  factory EwelinkCredentials.fromJson(Map<String, dynamic> json) =>
      _$EwelinkCredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$EwelinkCredentialsToJson(this);
}
