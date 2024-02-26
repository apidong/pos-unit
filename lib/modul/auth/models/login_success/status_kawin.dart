import 'package:json_annotation/json_annotation.dart';

part 'status_kawin.g.dart';

@JsonSerializable()
class StatusKawin {
  int? id;
  String? nama;

  StatusKawin({this.id, this.nama});

  factory StatusKawin.fromJson(Map<String, dynamic> json) {
    return _$StatusKawinFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatusKawinToJson(this);
}
