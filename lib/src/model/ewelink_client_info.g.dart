// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewelink_client_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EwelinkClientInfo _$EwelinkClientInfoFromJson(Map<String, dynamic> json) =>
    EwelinkClientInfo(
      json['appVersion'] as String,
      json['imei'] as String,
      json['model'] as String,
      json['os'] as String,
      json['romVersion'] as String,
    );

Map<String, dynamic> _$EwelinkClientInfoToJson(EwelinkClientInfo instance) =>
    <String, dynamic>{
      'appVersion': instance.appVersion,
      'imei': instance.imei,
      'model': instance.model,
      'os': instance.os,
      'romVersion': instance.romVersion,
    };
