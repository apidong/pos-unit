// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      sebutanKabupaten: json['sebutan_kabupaten'] as String?,
      sebutanKabupatenSingkat: json['sebutan_kabupaten_singkat'] as String?,
      sebutanKecamatan: json['sebutan_kecamatan'] as String?,
      sebutanKecamatanSingkat: json['sebutan_kecamatan_singkat'] as String?,
      sebutanDesa: json['sebutan_desa'] as String?,
      sebutanDusun: json['sebutan_dusun'] as String?,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'sebutan_kabupaten': instance.sebutanKabupaten,
      'sebutan_kabupaten_singkat': instance.sebutanKabupatenSingkat,
      'sebutan_kecamatan': instance.sebutanKecamatan,
      'sebutan_kecamatan_singkat': instance.sebutanKecamatanSingkat,
      'sebutan_desa': instance.sebutanDesa,
      'sebutan_dusun': instance.sebutanDusun,
    };
