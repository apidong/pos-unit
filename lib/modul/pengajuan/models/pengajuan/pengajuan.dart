import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'pengajuan.g.dart';

@JsonSerializable()
class Pengajuan {
  dynamic recordsTotal;
  dynamic recordsFiltered;
  List<Datum>? data;

  Pengajuan({
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });

  factory Pengajuan.fromJson(Map<String, dynamic> json) {
    return _$PengajuanFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PengajuanToJson(this);
}
