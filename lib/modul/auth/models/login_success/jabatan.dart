import 'package:json_annotation/json_annotation.dart';

part 'jabatan.g.dart';

@JsonSerializable()
class Jabatan {
  int? id;
  String? nama;
  String? tupoksi;
  int? jenis;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'created_by')
  dynamic createdBy;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'updated_by')
  int? updatedBy;

  Jabatan({
    this.id,
    this.nama,
    this.tupoksi,
    this.jenis,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  factory Jabatan.fromJson(Map<String, dynamic> json) {
    return _$JabatanFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JabatanToJson(this);
}
