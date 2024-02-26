import 'package:json_annotation/json_annotation.dart';

import 'region.pengajuan.dart';

part 'pelanggan.pengajuan.g.dart';

@JsonSerializable()
class Pelanggan {
  int? id;
  String? nama;
  @JsonKey(name: 'nomor_telepon')
  String? nomorTelepon;
  @JsonKey(name: 'nama_prov')
  String? namaProv;
  @JsonKey(name: 'nama_kab')
  String? namaKab;
  @JsonKey(name: 'nama_kec')
  String? namaKec;
  @JsonKey(name: 'kode_kec')
  String? kodeKec;
  @JsonKey(name: 'kode_pos')
  String? kodePos;
  String? alamat;
  String? lainnya;
  Region? region;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  Pelanggan({
    this.id,
    this.nama,
    this.nomorTelepon,
    this.namaProv,
    this.namaKab,
    this.namaKec,
    this.kodeKec,
    this.kodePos,
    this.alamat,
    this.lainnya,
    this.region,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Pelanggan.fromJson(Map<String, dynamic> json) {
    return _$PelangganFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PelangganToJson(this);
}
