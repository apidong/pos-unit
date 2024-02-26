// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pelanggan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pelanggan _$PelangganFromJson(Map<String, dynamic> json) => Pelanggan(
      id: json['id'] as int?,
      nama: json['nama'] as String?,
      nomorTelepon: json['nomor_telepon'] as String?,
      namaProv: json['nama_prov'] as String?,
      namaKab: json['nama_kab'] as String?,
      namaKec: json['nama_kec'] as String?,
      kodeKec: json['kode_kec'] as String?,
      kodePos: json['kode_pos'] as String?,
      alamat: json['alamat'] as String?,
      lainnya: json['lainnya'] as String?,
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$PelangganToJson(Pelanggan instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'nomor_telepon': instance.nomorTelepon,
      'nama_prov': instance.namaProv,
      'nama_kab': instance.namaKab,
      'nama_kec': instance.namaKec,
      'kode_kec': instance.kodeKec,
      'kode_pos': instance.kodePos,
      'alamat': instance.alamat,
      'lainnya': instance.lainnya,
      'region': instance.region,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
