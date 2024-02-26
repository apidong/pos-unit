// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jumlah_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JumlahNotification _$JumlahNotificationFromJson(Map<String, dynamic> json) =>
    JumlahNotification(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$JumlahNotificationToJson(JumlahNotification instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
