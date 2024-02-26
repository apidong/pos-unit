import 'package:json_annotation/json_annotation.dart';

import 'data.pengajuan.dart';

part 'periksa.pengajuan.g.dart';

@JsonSerializable()
class Periksa {
  bool? success;
  Data? data;
  String? message;

  Periksa({this.success, this.data, this.message});

  factory Periksa.fromJson(Map<String, dynamic> json) {
    return _$PeriksaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PeriksaToJson(this);
}
