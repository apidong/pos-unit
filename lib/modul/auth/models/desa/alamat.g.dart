// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alamat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alamat _$AlamatFromJson(Map<String, dynamic> json) => Alamat(
      kodePos: Alamat._convertnull(json['kode_pos']),
      alamatKantor: Alamat._convertnull(json['alamat_kantor']),
      kantorDesa: Alamat._convertnull(json['kantor_desa']),
      kodeDesa: Alamat._convertnull(json['kode_desa']),
      kodeKecamatan: json['kode_kecamatan'],
      kodeKabupaten: json['kode_kabupaten'],
      kodeProvinsi: json['kode_provinsi'],
      namaDesa: Alamat._convertnull(json['nama_desa']),
      namaKecamatan: Alamat._convertnull(json['nama_kecamatan']),
      namaKabupaten: Alamat._convertnull(json['nama_kabupaten']),
      namaProvinsi: Alamat._convertnull(json['nama_provinsi']),
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );

Map<String, dynamic> _$AlamatToJson(Alamat instance) => <String, dynamic>{
      'kode_pos': instance.kodePos,
      'alamat_kantor': instance.alamatKantor,
      'kantor_desa': instance.kantorDesa,
      'kode_desa': instance.kodeDesa,
      'kode_kecamatan': instance.kodeKecamatan,
      'kode_kabupaten': instance.kodeKabupaten,
      'kode_provinsi': instance.kodeProvinsi,
      'nama_desa': instance.namaDesa,
      'nama_kecamatan': instance.namaKecamatan,
      'nama_kabupaten': instance.namaKabupaten,
      'nama_provinsi': instance.namaProvinsi,
      'lat': instance.lat,
      'lng': instance.lng,
    };
