// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DesaModel _$DesaModelFromJson(Map<String, dynamic> json) => DesaModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesaModelToJson(DesaModel instance) => <String, dynamic>{
      'data': instance.data,
    };
