import 'package:json_annotation/json_annotation.dart';

import 'alamat.dart';
import 'koordinat_penerima.dart';
import 'koordinat_pengirim.dart';
import 'pelanggan.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  @JsonKey(name: 'nomor_do')
  dynamic nomorDo;
  @JsonKey(name: 'nama_pengirim')
  String? namaPengirim;
  @JsonKey(name: 'koordinat_pengirim')
  KoordinatPengirim? koordinatPengirim;
  @JsonKey(name: 'kode_pos_pengirim')
  String? kodePosPengirim;
  @JsonKey(name: 'nama_penerima')
  String? namaPenerima;
  @JsonKey(name: 'alamat_penerima')
  String? alamatPenerima;
  @JsonKey(name: 'kode_pos_penerima')
  String? kodePosPenerima;
  @JsonKey(name: 'koordinat_penerima')
  KoordinatPenerima? koordinatPenerima;
  @JsonKey(name: 'harga_total')
  String? hargaTotal;
  @JsonKey(name: 'ongkos_kirim')
  String? ongkosKirim;
  String? ekspedisi;
  String? tipe;
  String? status;
  String? kirim;
  @JsonKey(name: 'id_pembuat')
  int? idPembuat;
  @JsonKey(name: 'id_pelanggan')
  dynamic idPelanggan;
  @JsonKey(name: 'id_alamat')
  dynamic idAlamat;
  dynamic keterangan;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'detail_kurir')
  dynamic detailKurir;
  Alamat? alamat;
  Pelanggan? pelanggan;

  Datum({
    this.id,
    this.nomorDo,
    this.namaPengirim,
    this.koordinatPengirim,
    this.kodePosPengirim,
    this.namaPenerima,
    this.alamatPenerima,
    this.kodePosPenerima,
    this.koordinatPenerima,
    this.hargaTotal,
    this.ongkosKirim,
    this.ekspedisi,
    this.tipe,
    this.status,
    this.kirim,
    this.idPembuat,
    this.idPelanggan,
    this.idAlamat,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
    this.detailKurir,
    this.alamat,
    this.pelanggan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
