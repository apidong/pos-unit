import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {
  @JsonKey(name: 'sebutan_kabupaten')
  String? sebutanKabupaten;
  @JsonKey(name: 'sebutan_kabupaten_singkat')
  String? sebutanKabupatenSingkat;
  @JsonKey(name: 'sebutan_kecamatan')
  String? sebutanKecamatan;
  @JsonKey(name: 'sebutan_kecamatan_singkat')
  String? sebutanKecamatanSingkat;
  @JsonKey(name: 'sebutan_desa')
  String? sebutanDesa;
  @JsonKey(name: 'sebutan_dusun')
  String? sebutanDusun;

  Config({
    this.sebutanKabupaten,
    this.sebutanKabupatenSingkat,
    this.sebutanKecamatan,
    this.sebutanKecamatanSingkat,
    this.sebutanDesa,
    this.sebutanDusun,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return _$ConfigFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
