import 'package:json_annotation/json_annotation.dart';

part 'jenis_kelamin.g.dart';

@JsonSerializable()
class JenisKelamin {
  int? id;
  String? nama;

  JenisKelamin({this.id, this.nama});

  factory JenisKelamin.fromJson(Map<String, dynamic> json) {
    return _$JenisKelaminFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JenisKelaminToJson(this);
}
