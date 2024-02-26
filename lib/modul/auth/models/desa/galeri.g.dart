// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galeri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Galeri _$GaleriFromJson(Map<String, dynamic> json) => Galeri(
      id: Galeri._convertstring(json['id']),
      gambar: json['gambar'] as String?,
      nama: json['nama'] as String?,
      urlGambar: json['url_gambar'],
    );

Map<String, dynamic> _$GaleriToJson(Galeri instance) => <String, dynamic>{
      'id': instance.id,
      'gambar': instance.gambar,
      'nama': instance.nama,
      'url_gambar': instance.urlGambar,
    };
