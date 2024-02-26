import 'package:json_annotation/json_annotation.dart';

part 'koordinat_pengirim.g.dart';

@JsonSerializable()
class KoordinatPengirim {
  String? latitude;
  String? longitude;

  KoordinatPengirim({this.latitude, this.longitude});

  factory KoordinatPengirim.fromJson(Map<String, dynamic> json) {
    return _$KoordinatPengirimFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KoordinatPengirimToJson(this);
}
