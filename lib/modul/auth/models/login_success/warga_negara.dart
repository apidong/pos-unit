import 'package:json_annotation/json_annotation.dart';

part 'warga_negara.g.dart';

@JsonSerializable()
class WargaNegara {
  int? id;
  String? nama;

  WargaNegara({this.id, this.nama});

  factory WargaNegara.fromJson(Map<String, dynamic> json) {
    return _$WargaNegaraFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WargaNegaraToJson(this);
}
