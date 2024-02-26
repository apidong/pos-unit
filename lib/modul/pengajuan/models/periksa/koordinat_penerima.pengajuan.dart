import 'package:json_annotation/json_annotation.dart';

part 'koordinat_penerima.pengajuan.g.dart';

@JsonSerializable()
class KoordinatPenerima {
  String? latitude;
  String? longitude;

  KoordinatPenerima({this.latitude, this.longitude});

  factory KoordinatPenerima.fromJson(Map<String, dynamic> json) {
    return _$KoordinatPenerimaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KoordinatPenerimaToJson(this);
}
