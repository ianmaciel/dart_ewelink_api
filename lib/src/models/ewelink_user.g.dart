// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewelink_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EwelinkUser _$EwelinkUserFromJson(Map<String, dynamic> json) => EwelinkUser(
      json['apikey'] as String,
      json['appId'] as String,
      (json['appInfos'] as List<dynamic>)
          .map((e) => EwelinkAppInfos.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bindInfos'] as Map<String, dynamic>,
      json['accountInfo'] == null
          ? null
          : EwelinkAccountInfo.fromJson(
              json['accountInfo'] as Map<String, dynamic>),
      EwelinkClientInfo.fromJson(json['clientInfo'] as Map<String, dynamic>),
      json['countryCode'] as String,
      json['createdAt'] as String,
      json['currentFamilyId'] as String,
      json['email'] as String,
      json['extraPush'] as Map<String, dynamic>,
      json['ip'] as String,
      json['isAccepEmailAd'] as bool,
      json['lang'] as String,
      json['language'] as String,
      json['location'] as String,
      json['offlineTime'] as String,
      json['online'] as bool,
      json['password'] as String,
      json['platformLang'] as Map<String, dynamic>?,
      json['userStatus'] as String,
      json['timezone'] as Map<String, dynamic>?,
      json['extra'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$EwelinkUserToJson(EwelinkUser instance) =>
    <String, dynamic>{
      'apikey': instance.apikey,
      'appId': instance.appId,
      'appInfos': instance.appInfos.map((e) => e.toJson()).toList(),
      'bindInfos': instance.bindInfos,
      'accountInfo': instance.accountInfo?.toJson(),
      'clientInfo': instance.clientInfo.toJson(),
      'countryCode': instance.countryCode,
      'createdAt': instance.createdAt,
      'currentFamilyId': instance.currentFamilyId,
      'email': instance.email,
      'extraPush': instance.extraPush,
      'ip': instance.ip,
      'isAccepEmailAd': instance.isAccepEmailAd,
      'lang': instance.lang,
      'language': instance.language,
      'location': instance.location,
      'offlineTime': instance.offlineTime,
      'online': instance.online,
      'password': instance.password,
      'platformLang': instance.platformLang,
      'userStatus': instance.userStatus,
      'timezone': instance.timezone,
      'extra': instance.extra,
    };
