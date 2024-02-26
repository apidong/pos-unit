// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perangkat_desa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerangkatDesa _$PerangkatDesaFromJson(Map<String, dynamic> json) =>
    PerangkatDesa(
      namaKepalaDesa: json['nama_kepala_desa'],
      nipKepalaDesa: json['nip_kepala_desa'],
      namaKepalaCamat: json['nama_kepala_camat'] as String?,
      nipKepalaCamat: json['nip_kepala_camat'] as String?,
    );

Map<String, dynamic> _$PerangkatDesaToJson(PerangkatDesa instance) =>
    <String, dynamic>{
      'nama_kepala_desa': instance.namaKepalaDesa,
      'nip_kepala_desa': instance.nipKepalaDesa,
      'nama_kepala_camat': instance.namaKepalaCamat,
      'nip_kepala_camat': instance.nipKepalaCamat,
    };
