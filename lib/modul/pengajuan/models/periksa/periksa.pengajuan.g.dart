// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'periksa.pengajuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Periksa _$PeriksaFromJson(Map<String, dynamic> json) => Periksa(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PeriksaToJson(Periksa instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
