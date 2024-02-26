import 'package:json_annotation/json_annotation.dart';

import 'jabatan.dart';
import 'penduduk.dart';

part 'pamong.g.dart';

@JsonSerializable()
class Pamong {
  @JsonKey(name: 'pamong_id')
  int? pamongId;
  @JsonKey(name: 'config_id')
  int? configId;
  @JsonKey(name: 'pamong_nama')
  String? pamongNama;
  @JsonKey(name: 'gelar_depan')
  dynamic gelarDepan;
  @JsonKey(name: 'gelar_belakang')
  dynamic gelarBelakang;
  @JsonKey(name: 'pamong_nip')
  String? pamongNip;
  @JsonKey(name: 'pamong_tag_id_card')
  dynamic pamongTagIdCard;
  @JsonKey(name: 'pamong_pin')
  String? pamongPin;
  @JsonKey(name: 'pamong_nik')
  dynamic pamongNik;
  @JsonKey(name: 'pamong_status')
  int? pamongStatus;
  @JsonKey(name: 'pamong_tgl_terdaftar')
  String? pamongTglTerdaftar;
  @JsonKey(name: 'pamong_ttd')
  dynamic pamongTtd;
  dynamic foto;
  @JsonKey(name: 'id_pend')
  int? idPend;
  @JsonKey(name: 'pamong_tempatlahir')
  dynamic pamongTempatlahir;
  @JsonKey(name: 'pamong_tanggallahir')
  dynamic pamongTanggallahir;
  @JsonKey(name: 'pamong_sex')
  dynamic pamongSex;
  @JsonKey(name: 'pamong_pendidikan')
  dynamic pamongPendidikan;
  @JsonKey(name: 'pamong_agama')
  dynamic pamongAgama;
  @JsonKey(name: 'pamong_nosk')
  String? pamongNosk;
  @JsonKey(name: 'pamong_tglsk')
  dynamic pamongTglsk;
  @JsonKey(name: 'pamong_masajab')
  dynamic pamongMasajab;
  int? urut;
  @JsonKey(name: 'pamong_niap')
  String? pamongNiap;
  @JsonKey(name: 'pamong_pangkat')
  String? pamongPangkat;
  @JsonKey(name: 'pamong_nohenti')
  dynamic pamongNohenti;
  @JsonKey(name: 'pamong_tglhenti')
  dynamic pamongTglhenti;
  @JsonKey(name: 'pamong_ub')
  int? pamongUb;
  dynamic atasan;
  @JsonKey(name: 'bagan_tingkat')
  dynamic baganTingkat;
  @JsonKey(name: 'bagan_offset')
  dynamic baganOffset;
  @JsonKey(name: 'bagan_layout')
  String? baganLayout;
  @JsonKey(name: 'bagan_warna')
  String? baganWarna;
  int? kehadiran;
  @JsonKey(name: 'jabatan_id')
  int? jabatanId;
  Penduduk? penduduk;
  Jabatan? jabatan;

  Pamong({
    this.pamongId,
    this.configId,
    this.pamongNama,
    this.gelarDepan,
    this.gelarBelakang,
    this.pamongNip,
    this.pamongTagIdCard,
    this.pamongPin,
    this.pamongNik,
    this.pamongStatus,
    this.pamongTglTerdaftar,
    this.pamongTtd,
    this.foto,
    this.idPend,
    this.pamongTempatlahir,
    this.pamongTanggallahir,
    this.pamongSex,
    this.pamongPendidikan,
    this.pamongAgama,
    this.pamongNosk,
    this.pamongTglsk,
    this.pamongMasajab,
    this.urut,
    this.pamongNiap,
    this.pamongPangkat,
    this.pamongNohenti,
    this.pamongTglhenti,
    this.pamongUb,
    this.atasan,
    this.baganTingkat,
    this.baganOffset,
    this.baganLayout,
    this.baganWarna,
    this.kehadiran,
    this.jabatanId,
    this.penduduk,
    this.jabatan,
  });

  factory Pamong.fromJson(Map<String, dynamic> json) {
    return _$PamongFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PamongToJson(this);
}
