import 'package:json_annotation/json_annotation.dart';

part 'perangkat_desa.g.dart';

@JsonSerializable()
class PerangkatDesa {
  @JsonKey(name: 'nama_kepala_desa')
  dynamic namaKepalaDesa;
  @JsonKey(name: 'nip_kepala_desa')
  dynamic nipKepalaDesa;
  @JsonKey(name: 'nama_kepala_camat')
  String? namaKepalaCamat;
  @JsonKey(name: 'nip_kepala_camat')
  String? nipKepalaCamat;

  PerangkatDesa({
    this.namaKepalaDesa,
    this.nipKepalaDesa,
    this.namaKepalaCamat,
    this.nipKepalaCamat,
  });

  factory PerangkatDesa.fromJson(Map<String, dynamic> json) {
    return _$PerangkatDesaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PerangkatDesaToJson(this);
}
