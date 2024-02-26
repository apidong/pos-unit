import 'package:json_annotation/json_annotation.dart';

part 'region.pengajuan.g.dart';

@JsonSerializable()
class Region {
  String? latitude;
  String? longitude;

  Region({this.latitude, this.longitude});

  factory Region.fromJson(Map<String, dynamic> json) {
    return _$RegionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
