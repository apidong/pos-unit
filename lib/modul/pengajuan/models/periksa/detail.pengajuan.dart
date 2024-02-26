import 'package:json_annotation/json_annotation.dart';

import 'ukuran.pengajuan.dart';

part 'detail.pengajuan.g.dart';

@JsonSerializable()
class Detail {
  int? id;
  @JsonKey(name: 'id_pemesanan_do')
  int? idPemesananDo;
  @JsonKey(name: 'id_produk')
  int? idProduk;
  String? sku;
  @JsonKey(name: 'nama_produk')
  String? namaProduk;
  @JsonKey(name: 'deskripsi_produk')
  dynamic deskripsiProduk;
  @JsonKey(name: 'harga_produk')
  String? hargaProduk;
  @JsonKey(name: 'berat_produk')
  String? beratProduk;
  Ukuran? ukuran;
  String? jumlah;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Detail({
    this.id,
    this.idPemesananDo,
    this.idProduk,
    this.sku,
    this.namaProduk,
    this.deskripsiProduk,
    this.hargaProduk,
    this.beratProduk,
    this.ukuran,
    this.jumlah,
    this.createdAt,
    this.updatedAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return _$DetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
