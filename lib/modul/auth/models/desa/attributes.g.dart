// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      logo: json['logo'] as String?,
      emailDesa: json['email_desa'] as String?,
      telepon: json['telepon'],
      website: json['website'] as String?,
      galeri: (json['galeri'] as List<dynamic>?)
          ?.map((e) => Galeri.fromJson(e as Map<String, dynamic>))
          .toList(),
      branding: json['branding'] as String?,
      operator: json['operator'] as String?,
      perangkatDesa: json['perangkat_desa'] == null
          ? null
          : PerangkatDesa.fromJson(
              json['perangkat_desa'] as Map<String, dynamic>),
      alamat: json['alamat'] == null
          ? null
          : Alamat.fromJson(json['alamat'] as Map<String, dynamic>),
      config: json['config'] == null
          ? null
          : Config.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'email_desa': instance.emailDesa,
      'telepon': instance.telepon,
      'website': instance.website,
      'galeri': instance.galeri,
      'branding': instance.branding,
      'operator': instance.operator,
      'perangkat_desa': instance.perangkatDesa,
      'alamat': instance.alamat,
      'config': instance.config,
    };
