// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.pengajuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      id: json['id'] as int?,
      idPemesananDo: json['id_pemesanan_do'] as int?,
      idProduk: json['id_produk'] as int?,
      sku: json['sku'] as String?,
      namaProduk: json['nama_produk'] as String?,
      deskripsiProduk: json['deskripsi_produk'],
      hargaProduk: json['harga_produk'] as String?,
      beratProduk: json['berat_produk'] as String?,
      ukuran: json['ukuran'] == null
          ? null
          : Ukuran.fromJson(json['ukuran'] as Map<String, dynamic>),
      jumlah: json['jumlah'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'id': instance.id,
      'id_pemesanan_do': instance.idPemesananDo,
      'id_produk': instance.idProduk,
      'sku': instance.sku,
      'nama_produk': instance.namaProduk,
      'deskripsi_produk': instance.deskripsiProduk,
      'harga_produk': instance.hargaProduk,
      'berat_produk': instance.beratProduk,
      'ukuran': instance.ukuran,
      'jumlah': instance.jumlah,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
