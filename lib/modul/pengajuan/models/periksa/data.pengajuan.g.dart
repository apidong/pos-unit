// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.pengajuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      nomorDo: json['nomor_do'],
      namaPengirim: json['nama_pengirim'] as String?,
      koordinatPengirim: json['koordinat_pengirim'] == null
          ? null
          : KoordinatPengirim.fromJson(
              json['koordinat_pengirim'] as Map<String, dynamic>),
      kodePosPengirim: json['kode_pos_pengirim'] as String?,
      namaPenerima: json['nama_penerima'] as String?,
      alamatPenerima: json['alamat_penerima'] as String?,
      kodePosPenerima: json['kode_pos_penerima'] as String?,
      koordinatPenerima: json['koordinat_penerima'] == null
          ? null
          : KoordinatPenerima.fromJson(
              json['koordinat_penerima'] as Map<String, dynamic>),
      hargaTotal: json['harga_total'] as String?,
      ongkosKirim: json['ongkos_kirim'] as String?,
      ekspedisi: json['ekspedisi'] as String?,
      tipe: json['tipe'] as String?,
      status: json['status'] as String?,
      kirim: json['kirim'] as String?,
      idPembuat: json['id_pembuat'] as int?,
      idPelanggan: json['id_pelanggan'] as int?,
      idAlamat: json['id_alamat'] as int?,
      keterangan: json['keterangan'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      detailKurir: json['detail_kurir'],
      alamat: json['alamat'] == null
          ? null
          : Alamat.fromJson(json['alamat'] as Map<String, dynamic>),
      pelanggan: json['pelanggan'] == null
          ? null
          : Pelanggan.fromJson(json['pelanggan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nomor_do': instance.nomorDo,
      'nama_pengirim': instance.namaPengirim,
      'koordinat_pengirim': instance.koordinatPengirim,
      'kode_pos_pengirim': instance.kodePosPengirim,
      'nama_penerima': instance.namaPenerima,
      'alamat_penerima': instance.alamatPenerima,
      'kode_pos_penerima': instance.kodePosPenerima,
      'koordinat_penerima': instance.koordinatPenerima,
      'harga_total': instance.hargaTotal,
      'ongkos_kirim': instance.ongkosKirim,
      'ekspedisi': instance.ekspedisi,
      'tipe': instance.tipe,
      'status': instance.status,
      'kirim': instance.kirim,
      'id_pembuat': instance.idPembuat,
      'id_pelanggan': instance.idPelanggan,
      'id_alamat': instance.idAlamat,
      'keterangan': instance.keterangan,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'detail_kurir': instance.detailKurir,
      'alamat': instance.alamat,
      'pelanggan': instance.pelanggan,
    };
