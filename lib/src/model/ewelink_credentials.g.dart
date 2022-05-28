// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewelink_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EwelinkCredentials _$EwelinkCredentialsFromJson(Map<String, dynamic> json) =>
    EwelinkCredentials(
      json['at'] as String,
      json['rt'] as String,
      json['region'] as String,
      EwelinkUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EwelinkCredentialsToJson(EwelinkCredentials instance) =>
    <String, dynamic>{
      'at': instance.at,
      'rt': instance.rt,
      'region': instance.region,
      'user': instance.user.toJson(),
    };
