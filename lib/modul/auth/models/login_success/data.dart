import 'package:json_annotation/json_annotation.dart';

import 'pamong.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  @JsonKey(name: 'config_id')
  int? configId;
  String? username;
  @JsonKey(name: 'id_grup')
  int? idGrup;
  @JsonKey(name: 'pamong_id')
  int? pamongId;
  String? email;
  @JsonKey(name: 'last_login')
  String? lastLogin;
  @JsonKey(name: 'email_verified_at')
  dynamic emailVerifiedAt;
  int? active;
  String? nama;
  @JsonKey(name: 'id_telegram')
  String? idTelegram;
  String? token;
  @JsonKey(name: 'token_exp')
  dynamic tokenExp;
  @JsonKey(name: 'telegram_verified_at')
  dynamic telegramVerifiedAt;
  @JsonKey(name: 'notif_telegram')
  int? notifTelegram;
  String? company;
  String? phone;
  String? foto;
  String? session;
  Pamong? pamong;

  Data({
    this.id,
    this.configId,
    this.username,
    this.idGrup,
    this.pamongId,
    this.email,
    this.lastLogin,
    this.emailVerifiedAt,
    this.active,
    this.nama,
    this.idTelegram,
    this.token,
    this.tokenExp,
    this.telegramVerifiedAt,
    this.notifTelegram,
    this.company,
    this.phone,
    this.foto,
    this.session,
    this.pamong,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
