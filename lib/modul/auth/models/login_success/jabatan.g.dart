// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jabatan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Jabatan _$JabatanFromJson(Map<String, dynamic> json) => Jabatan(
      id: json['id'] as int?,
      nama: json['nama'] as String?,
      tupoksi: json['tupoksi'] as String?,
      jenis: json['jenis'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      updatedBy: json['updated_by'] as int?,
    );

Map<String, dynamic> _$JabatanToJson(Jabatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'tupoksi': instance.tupoksi,
      'jenis': instance.jenis,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
    };
