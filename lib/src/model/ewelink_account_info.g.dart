// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewelink_account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EwelinkAccountInfo _$EwelinkAccountInfoFromJson(Map<String, dynamic> json) =>
    EwelinkAccountInfo(
      json['expiredAt'] as String,
      json['level'] as int,
      json['validAt'] as String,
    );

Map<String, dynamic> _$EwelinkAccountInfoToJson(EwelinkAccountInfo instance) =>
    <String, dynamic>{
      'expiredAt': instance.expiredAt,
      'level': instance.level,
      'validAt': instance.validAt,
    };
