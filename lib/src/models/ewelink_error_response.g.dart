// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewelink_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EwelinkErrorResponse _$EwelinkErrorResponseFromJson(
        Map<String, dynamic> json) =>
    EwelinkErrorResponse(
      msg: json['msg'] as String? ?? '',
      errmsg: json['errmsg'] as String? ?? '',
      code: json['error'] as int,
    );

Map<String, dynamic> _$EwelinkErrorResponseToJson(
        EwelinkErrorResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'errmsg': instance.errmsg,
      'error': instance.code,
    };
