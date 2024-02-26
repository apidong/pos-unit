// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      configId: json['config_id'] as int?,
      username: json['username'] as String?,
      idGrup: json['id_grup'] as int?,
      pamongId: json['pamong_id'] as int?,
      email: json['email'] as String?,
      lastLogin: json['last_login'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      active: json['active'] as int?,
      nama: json['nama'] as String?,
      idTelegram: json['id_telegram'] as String?,
      token: json['token'] as String?,
      tokenExp: json['token_exp'],
      telegramVerifiedAt: json['telegram_verified_at'],
      notifTelegram: json['notif_telegram'] as int?,
      company: json['company'] as String?,
      phone: json['phone'] as String?,
      foto: json['foto'] as String?,
      session: json['session'] as String?,
      pamong: json['pamong'] == null
          ? null
          : Pamong.fromJson(json['pamong'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'config_id': instance.configId,
      'username': instance.username,
      'id_grup': instance.idGrup,
      'pamong_id': instance.pamongId,
      'email': instance.email,
      'last_login': instance.lastLogin,
      'email_verified_at': instance.emailVerifiedAt,
      'active': instance.active,
      'nama': instance.nama,
      'id_telegram': instance.idTelegram,
      'token': instance.token,
      'token_exp': instance.tokenExp,
      'telegram_verified_at': instance.telegramVerifiedAt,
      'notif_telegram': instance.notifTelegram,
      'company': instance.company,
      'phone': instance.phone,
      'foto': instance.foto,
      'session': instance.session,
      'pamong': instance.pamong,
    };
