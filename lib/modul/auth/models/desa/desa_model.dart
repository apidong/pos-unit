import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'desa_model.g.dart';

@JsonSerializable()
class DesaModel {
  Data? data;

  DesaModel({this.data});

  factory DesaModel.fromJson(Map<String, dynamic> json) {
    return _$DesaModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DesaModelToJson(this);
}
