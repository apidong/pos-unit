import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_success.g.dart';

@JsonSerializable()
class LoginSuccess {
  bool? success;
  Data? data;
  String? message;

  LoginSuccess({
    this.success,
    this.data,
    this.message,
  });

  factory LoginSuccess.fromJson(Map<String, dynamic> json) {
    return _$LoginSuccessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginSuccessToJson(this);
}
