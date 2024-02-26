// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengajuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pengajuan _$PengajuanFromJson(Map<String, dynamic> json) => Pengajuan(
      recordsTotal: json['recordsTotal'],
      recordsFiltered: json['recordsFiltered'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PengajuanToJson(Pengajuan instance) => <String, dynamic>{
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
