import 'package:json_annotation/json_annotation.dart';

part 'galeri.g.dart';

@JsonSerializable()
class Galeri {
  @JsonKey(name: 'id', fromJson: _convertstring)
  dynamic id;
  String? gambar;
  String? nama;
  @JsonKey(name: 'url_gambar')
  dynamic urlGambar;

  Galeri({this.id, this.gambar, this.nama, this.urlGambar});

  factory Galeri.fromJson(Map<String, dynamic> json) {
    return _$GaleriFromJson(json);
  }

  static String _convertstring(dynamic values) {
    return values.toString();
  }

  Map<String, dynamic> toJson() => _$GaleriToJson(this);
}
