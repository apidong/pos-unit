import 'package:json_annotation/json_annotation.dart';

part 'ukuran.pengajuan.g.dart';

@JsonSerializable()
class Ukuran {
  dynamic width;
  dynamic height;
  dynamic length;

  Ukuran({this.width, this.height, this.length});

  factory Ukuran.fromJson(Map<String, dynamic> json) {
    return _$UkuranFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UkuranToJson(this);
}
