import 'package:json_annotation/json_annotation.dart';

part 'penduduk_status.g.dart';

@JsonSerializable()
class PendudukStatus {
  int? id;
  String? nama;

  PendudukStatus({this.id, this.nama});

  factory PendudukStatus.fromJson(Map<String, dynamic> json) {
    return _$PendudukStatusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendudukStatusToJson(this);
}
