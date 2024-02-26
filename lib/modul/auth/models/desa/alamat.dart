import 'package:json_annotation/json_annotation.dart';

part 'alamat.g.dart';

@JsonSerializable()
class Alamat {
  @JsonKey(name: 'kode_pos', fromJson: _convertnull)
  dynamic kodePos;
  @JsonKey(name: 'alamat_kantor', fromJson: _convertnull)
  String? alamatKantor;
  @JsonKey(name: 'kantor_desa', fromJson: _convertnull)
  dynamic kantorDesa;
  @JsonKey(name: 'kode_desa', fromJson: _convertnull)
  dynamic kodeDesa;
  @JsonKey(name: 'kode_kecamatan')
  dynamic kodeKecamatan;
  @JsonKey(name: 'kode_kabupaten')
  dynamic kodeKabupaten;
  @JsonKey(name: 'kode_provinsi')
  dynamic kodeProvinsi;
  @JsonKey(name: 'nama_desa', fromJson: _convertnull)
  String? namaDesa;
  @JsonKey(name: 'nama_kecamatan', fromJson: _convertnull)
  dynamic namaKecamatan;
  @JsonKey(name: 'nama_kabupaten', fromJson: _convertnull)
  String? namaKabupaten;
  @JsonKey(name: 'nama_provinsi', fromJson: _convertnull)
  dynamic namaProvinsi;
  String? lat;
  String? lng;

  Alamat({
    this.kodePos,
    this.alamatKantor,
    this.kantorDesa,
    this.kodeDesa,
    this.kodeKecamatan,
    this.kodeKabupaten,
    this.kodeProvinsi,
    this.namaDesa,
    this.namaKecamatan,
    this.namaKabupaten,
    this.namaProvinsi,
    this.lat,
    this.lng,
  });

  factory Alamat.fromJson(Map<String, dynamic> json) {
    return _$AlamatFromJson(json);
  }

  static String _convertnull(dynamic values) {
    if (values == null) {
      return '-';
    }
    return values.toString();
  }

  Map<String, dynamic> toJson() => _$AlamatToJson(this);
}
