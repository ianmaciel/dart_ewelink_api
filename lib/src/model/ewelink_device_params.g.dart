// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewelink_device_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EwelinkDeviceParams _$EwelinkDeviceParamsFromJson(Map<String, dynamic> json) =>
    EwelinkDeviceParams(
      status: json['switch'] as String?,
      switches: (json['switches'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$EwelinkDeviceParamsToJson(
        EwelinkDeviceParams instance) =>
    <String, dynamic>{
      'switch': instance.status,
      'switches': instance.switches,
    };
