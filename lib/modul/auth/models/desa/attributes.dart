import 'package:json_annotation/json_annotation.dart';

import 'alamat.dart';
import 'config.dart';
import 'galeri.dart';
import 'perangkat_desa.dart';

part 'attributes.g.dart';

@JsonSerializable()
class Attributes {
  String? logo;
  @JsonKey(name: 'email_desa')
  String? emailDesa;
  dynamic telepon;
  String? website;
  List<Galeri>? galeri;
  String? branding;
  String? operator;
  @JsonKey(name: 'perangkat_desa')
  PerangkatDesa? perangkatDesa;
  Alamat? alamat;
  Config? config;

  Attributes({
    this.logo,
    this.emailDesa,
    this.telepon,
    this.website,
    this.galeri,
    this.branding,
    this.operator,
    this.perangkatDesa,
    this.alamat,
    this.config,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return _$AttributesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}
