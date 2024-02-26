import 'package:json_annotation/json_annotation.dart';

part 'cacat.g.dart';

@JsonSerializable()
class Cacat {
  int? id;
  String? nama;

  Cacat({this.id, this.nama});

  factory Cacat.fromJson(Map<String, dynamic> json) => _$CacatFromJson(json);

  Map<String, dynamic> toJson() => _$CacatToJson(this);
}
