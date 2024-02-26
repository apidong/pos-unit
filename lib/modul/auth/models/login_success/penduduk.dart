import 'package:json_annotation/json_annotation.dart';

import 'agama.dart';
import 'cacat.dart';
import 'golongan_darah.dart';
import 'jenis_kelamin.dart';
import 'pekerjaan.dart';
import 'pendidikan.dart';
import 'penduduk_status.dart';
import 'status_kawin.dart';
import 'warga_negara.dart';

part 'penduduk.g.dart';

@JsonSerializable()
class Penduduk {
  int? id;
  @JsonKey(name: 'config_id')
  int? configId;
  String? nama;
  String? nik;
  @JsonKey(name: 'id_kk')
  int? idKk;
  @JsonKey(name: 'kk_level')
  int? kkLevel;
  @JsonKey(name: 'id_rtm')
  dynamic idRtm;
  @JsonKey(name: 'rtm_level')
  dynamic rtmLevel;
  int? sex;
  String? tempatlahir;
  DateTime? tanggallahir;
  @JsonKey(name: 'agama_id')
  int? agamaId;
  @JsonKey(name: 'pendidikan_kk_id')
  int? pendidikanKkId;
  @JsonKey(name: 'pendidikan_sedang_id')
  dynamic pendidikanSedangId;
  @JsonKey(name: 'pekerjaan_id')
  int? pekerjaanId;
  @JsonKey(name: 'status_kawin')
  StatusKawin? statusKawin;
  @JsonKey(name: 'warganegara_id')
  int? warganegaraId;
  @JsonKey(name: 'dokumen_pasport')
  dynamic dokumenPasport;
  @JsonKey(name: 'dokumen_kitas')
  dynamic dokumenKitas;
  @JsonKey(name: 'ayah_nik')
  dynamic ayahNik;
  @JsonKey(name: 'ibu_nik')
  dynamic ibuNik;
  @JsonKey(name: 'nama_ayah')
  String? namaAyah;
  @JsonKey(name: 'nama_ibu')
  String? namaIbu;
  dynamic foto;
  @JsonKey(name: 'golongan_darah_id')
  int? golonganDarahId;
  @JsonKey(name: 'id_cluster')
  int? idCluster;
  int? status;
  @JsonKey(name: 'alamat_sebelumnya')
  dynamic alamatSebelumnya;
  @JsonKey(name: 'alamat_sekarang')
  String? alamatSekarang;
  @JsonKey(name: 'status_dasar')
  int? statusDasar;
  dynamic hamil;
  @JsonKey(name: 'cacat_id')
  int? cacatId;
  @JsonKey(name: 'sakit_menahun_id')
  dynamic sakitMenahunId;
  @JsonKey(name: 'akta_lahir')
  dynamic aktaLahir;
  @JsonKey(name: 'akta_perkawinan')
  dynamic aktaPerkawinan;
  dynamic tanggalperkawinan;
  @JsonKey(name: 'akta_perceraian')
  dynamic aktaPerceraian;
  dynamic tanggalperceraian;
  @JsonKey(name: 'cara_kb_id')
  dynamic caraKbId;
  dynamic telepon;
  @JsonKey(name: 'tanggal_akhir_paspor')
  dynamic tanggalAkhirPaspor;
  @JsonKey(name: 'no_kk_sebelumnya')
  dynamic noKkSebelumnya;
  @JsonKey(name: 'ktp_el')
  int? ktpEl;
  @JsonKey(name: 'status_rekam')
  int? statusRekam;
  @JsonKey(name: 'waktu_lahir')
  dynamic waktuLahir;
  @JsonKey(name: 'tempat_dilahirkan')
  dynamic tempatDilahirkan;
  @JsonKey(name: 'jenis_kelahiran')
  dynamic jenisKelahiran;
  @JsonKey(name: 'kelahiran_anak_ke')
  dynamic kelahiranAnakKe;
  @JsonKey(name: 'penolong_kelahiran')
  dynamic penolongKelahiran;
  @JsonKey(name: 'berat_lahir')
  dynamic beratLahir;
  @JsonKey(name: 'panjang_lahir')
  dynamic panjangLahir;
  @JsonKey(name: 'tag_id_card')
  dynamic tagIdCard;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'created_by')
  int? createdBy;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'updated_by')
  dynamic updatedBy;
  @JsonKey(name: 'id_asuransi')
  int? idAsuransi;
  @JsonKey(name: 'no_asuransi')
  dynamic noAsuransi;
  dynamic email;
  @JsonKey(name: 'email_token')
  dynamic emailToken;
  @JsonKey(name: 'email_tgl_kadaluarsa')
  dynamic emailTglKadaluarsa;
  @JsonKey(name: 'email_tgl_verifikasi')
  dynamic emailTglVerifikasi;
  dynamic telegram;
  @JsonKey(name: 'telegram_token')
  dynamic telegramToken;
  @JsonKey(name: 'telegram_tgl_kadaluarsa')
  dynamic telegramTglKadaluarsa;
  @JsonKey(name: 'telegram_tgl_verifikasi')
  dynamic telegramTglVerifikasi;
  @JsonKey(name: 'bahasa_id')
  dynamic bahasaId;
  dynamic ket;
  @JsonKey(name: 'negara_asal')
  dynamic negaraAsal;
  @JsonKey(name: 'tempat_cetak_ktp')
  dynamic tempatCetakKtp;
  @JsonKey(name: 'tanggal_cetak_ktp')
  dynamic tanggalCetakKtp;
  dynamic suku;
  @JsonKey(name: 'bpjs_ketenagakerjaan')
  dynamic bpjsKetenagakerjaan;
  @JsonKey(name: 'hubung_warga')
  String? hubungWarga;
  @JsonKey(name: 'jenis_kelamin')
  JenisKelamin? jenisKelamin;
  Agama? agama;
  Pendidikan? pendidikan;
  Pekerjaan? pekerjaan;
  @JsonKey(name: 'warga_negara')
  WargaNegara? wargaNegara;
  @JsonKey(name: 'golongan_darah')
  GolonganDarah? golonganDarah;
  Cacat? cacat;
  @JsonKey(name: 'penduduk_status')
  PendudukStatus? pendudukStatus;

  Penduduk({
    this.id,
    this.configId,
    this.nama,
    this.nik,
    this.idKk,
    this.kkLevel,
    this.idRtm,
    this.rtmLevel,
    this.sex,
    this.tempatlahir,
    this.tanggallahir,
    this.agamaId,
    this.pendidikanKkId,
    this.pendidikanSedangId,
    this.pekerjaanId,
    this.statusKawin,
    this.warganegaraId,
    this.dokumenPasport,
    this.dokumenKitas,
    this.ayahNik,
    this.ibuNik,
    this.namaAyah,
    this.namaIbu,
    this.foto,
    this.golonganDarahId,
    this.idCluster,
    this.status,
    this.alamatSebelumnya,
    this.alamatSekarang,
    this.statusDasar,
    this.hamil,
    this.cacatId,
    this.sakitMenahunId,
    this.aktaLahir,
    this.aktaPerkawinan,
    this.tanggalperkawinan,
    this.aktaPerceraian,
    this.tanggalperceraian,
    this.caraKbId,
    this.telepon,
    this.tanggalAkhirPaspor,
    this.noKkSebelumnya,
    this.ktpEl,
    this.statusRekam,
    this.waktuLahir,
    this.tempatDilahirkan,
    this.jenisKelahiran,
    this.kelahiranAnakKe,
    this.penolongKelahiran,
    this.beratLahir,
    this.panjangLahir,
    this.tagIdCard,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.idAsuransi,
    this.noAsuransi,
    this.email,
    this.emailToken,
    this.emailTglKadaluarsa,
    this.emailTglVerifikasi,
    this.telegram,
    this.telegramToken,
    this.telegramTglKadaluarsa,
    this.telegramTglVerifikasi,
    this.bahasaId,
    this.ket,
    this.negaraAsal,
    this.tempatCetakKtp,
    this.tanggalCetakKtp,
    this.suku,
    this.bpjsKetenagakerjaan,
    this.hubungWarga,
    this.jenisKelamin,
    this.agama,
    this.pendidikan,
    this.pekerjaan,
    this.wargaNegara,
    this.golonganDarah,
    this.cacat,
    this.pendudukStatus,
  });

  factory Penduduk.fromJson(Map<String, dynamic> json) {
    return _$PendudukFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendudukToJson(this);
}
