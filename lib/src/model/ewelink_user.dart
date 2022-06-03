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

import 'ewelink_account_info.dart';
import 'ewelink_app_infos.dart';
import 'ewelink_client_info.dart';

part 'ewelink_user.g.dart';

@JsonSerializable(explicitToJson: true)
class EwelinkUser {
  EwelinkUser(
    this.apikey,
    this.appId,
    this.appInfos,
    this.bindInfos,
    this.accountInfo,
    this.clientInfo,
    this.countryCode,
    this.createdAt,
    this.currentFamilyId,
    this.email,
    this.extra,
    this.extraPush,
    this.ip,
    this.isAccepEmailAd,
    this.lang,
    this.language,
    this.location,
    this.offlineTime,
    this.online,
    this.password,
    this.platformLang,
    this.userStatus,
  );
  String apikey;
  String appId;
  List<EwelinkAppInfos> appInfos;
  Map<String, dynamic> bindInfos;
  EwelinkAccountInfo accountInfo;
  EwelinkClientInfo clientInfo;
  String countryCode;
  String createdAt;
  String currentFamilyId;
  String email;
  Map<String, dynamic> extra;
  Map<String, dynamic> extraPush;
  String ip;
  bool isAccepEmailAd;
  String lang;
  String language;
  String location;
  String offlineTime;
  bool online;
  String password;
  Map<String, dynamic> platformLang;
  String userStatus;

  factory EwelinkUser.fromJson(Map<String, dynamic> json) =>
      _$EwelinkUserFromJson(json);
  Map<String, dynamic> toJson() => _$EwelinkUserToJson(this);
}
