import 'package:json_annotation/json_annotation.dart';

part 'golongan_darah.g.dart';

@JsonSerializable()
class GolonganDarah {
  int? id;
  String? nama;

  GolonganDarah({this.id, this.nama});

  factory GolonganDarah.fromJson(Map<String, dynamic> json) {
    return _$GolonganDarahFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GolonganDarahToJson(this);
}
