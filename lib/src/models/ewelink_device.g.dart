// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewelink_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EwelinkDevice _$EwelinkDeviceFromJson(Map<String, dynamic> json) =>
    EwelinkDevice(
      json['online'] as bool,
      json['deviceid'] as String,
      json['name'] as String,
      json['type'] as String,
      EwelinkDeviceParams.fromJson(json['params'] as Map<String, dynamic>),
      json['tags'] == null
          ? null
          : EwelinkDeviceTags.fromJson(json['tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EwelinkDeviceToJson(EwelinkDevice instance) =>
    <String, dynamic>{
      'online': instance.online,
      'deviceid': instance.deviceid,
      'name': instance.name,
      'type': instance.type,
      'params': instance.params.toJson(),
      'tags': instance.tags?.toJson(),
    };
