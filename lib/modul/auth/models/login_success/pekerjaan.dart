import 'package:json_annotation/json_annotation.dart';

part 'pekerjaan.g.dart';

@JsonSerializable()
class Pekerjaan {
  int? id;
  String? nama;

  Pekerjaan({this.id, this.nama});

  factory Pekerjaan.fromJson(Map<String, dynamic> json) {
    return _$PekerjaanFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PekerjaanToJson(this);
}
