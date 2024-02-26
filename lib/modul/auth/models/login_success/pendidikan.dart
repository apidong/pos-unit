import 'package:json_annotation/json_annotation.dart';

part 'pendidikan.g.dart';

@JsonSerializable()
class Pendidikan {
  int? id;
  String? nama;

  Pendidikan({this.id, this.nama});

  factory Pendidikan.fromJson(Map<String, dynamic> json) {
    return _$PendidikanFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendidikanToJson(this);
}
