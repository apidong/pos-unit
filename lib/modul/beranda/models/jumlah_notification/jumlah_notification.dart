import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'jumlah_notification.g.dart';

@JsonSerializable()
class JumlahNotification {
  bool? success;
  Data? data;
  String? message;

  JumlahNotification({this.success, this.data, this.message});

  factory JumlahNotification.fromJson(Map<String, dynamic> json) {
    return _$JumlahNotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JumlahNotificationToJson(this);
}
