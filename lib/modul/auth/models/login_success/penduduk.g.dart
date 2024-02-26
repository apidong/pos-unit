// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penduduk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Penduduk _$PendudukFromJson(Map<String, dynamic> json) => Penduduk(
      id: json['id'] as int?,
      configId: json['config_id'] as int?,
      nama: json['nama'] as String?,
      nik: json['nik'] as String?,
      idKk: json['id_kk'] as int?,
      kkLevel: json['kk_level'] as int?,
      idRtm: json['id_rtm'],
      rtmLevel: json['rtm_level'],
      sex: json['sex'] as int?,
      tempatlahir: json['tempatlahir'] as String?,
      tanggallahir: json['tanggallahir'] == null
          ? null
          : DateTime.parse(json['tanggallahir'] as String),
      agamaId: json['agama_id'] as int?,
      pendidikanKkId: json['pendidikan_kk_id'] as int?,
      pendidikanSedangId: json['pendidikan_sedang_id'],
      pekerjaanId: json['pekerjaan_id'] as int?,
      statusKawin: json['status_kawin'] == null
          ? null
          : StatusKawin.fromJson(json['status_kawin'] as Map<String, dynamic>),
      warganegaraId: json['warganegara_id'] as int?,
      dokumenPasport: json['dokumen_pasport'],
      dokumenKitas: json['dokumen_kitas'],
      ayahNik: json['ayah_nik'],
      ibuNik: json['ibu_nik'],
      namaAyah: json['nama_ayah'] as String?,
      namaIbu: json['nama_ibu'] as String?,
      foto: json['foto'],
      golonganDarahId: json['golongan_darah_id'] as int?,
      idCluster: json['id_cluster'] as int?,
      status: json['status'] as int?,
      alamatSebelumnya: json['alamat_sebelumnya'],
      alamatSekarang: json['alamat_sekarang'] as String?,
      statusDasar: json['status_dasar'] as int?,
      hamil: json['hamil'],
      cacatId: json['cacat_id'] as int?,
      sakitMenahunId: json['sakit_menahun_id'],
      aktaLahir: json['akta_lahir'],
      aktaPerkawinan: json['akta_perkawinan'],
      tanggalperkawinan: json['tanggalperkawinan'],
      aktaPerceraian: json['akta_perceraian'],
      tanggalperceraian: json['tanggalperceraian'],
      caraKbId: json['cara_kb_id'],
      telepon: json['telepon'],
      tanggalAkhirPaspor: json['tanggal_akhir_paspor'],
      noKkSebelumnya: json['no_kk_sebelumnya'],
      ktpEl: json['ktp_el'] as int?,
      statusRekam: json['status_rekam'] as int?,
      waktuLahir: json['waktu_lahir'],
      tempatDilahirkan: json['tempat_dilahirkan'],
      jenisKelahiran: json['jenis_kelahiran'],
      kelahiranAnakKe: json['kelahiran_anak_ke'],
      penolongKelahiran: json['penolong_kelahiran'],
      beratLahir: json['berat_lahir'],
      panjangLahir: json['panjang_lahir'],
      tagIdCard: json['tag_id_card'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      updatedBy: json['updated_by'],
      idAsuransi: json['id_asuransi'] as int?,
      noAsuransi: json['no_asuransi'],
      email: json['email'],
      emailToken: json['email_token'],
      emailTglKadaluarsa: json['email_tgl_kadaluarsa'],
      emailTglVerifikasi: json['email_tgl_verifikasi'],
      telegram: json['telegram'],
      telegramToken: json['telegram_token'],
      telegramTglKadaluarsa: json['telegram_tgl_kadaluarsa'],
      telegramTglVerifikasi: json['telegram_tgl_verifikasi'],
      bahasaId: json['bahasa_id'],
      ket: json['ket'],
      negaraAsal: json['negara_asal'],
      tempatCetakKtp: json['tempat_cetak_ktp'],
      tanggalCetakKtp: json['tanggal_cetak_ktp'],
      suku: json['suku'],
      bpjsKetenagakerjaan: json['bpjs_ketenagakerjaan'],
      hubungWarga: json['hubung_warga'] as String?,
      jenisKelamin: json['jenis_kelamin'] == null
          ? null
          : JenisKelamin.fromJson(
              json['jenis_kelamin'] as Map<String, dynamic>),
      agama: json['agama'] == null
          ? null
          : Agama.fromJson(json['agama'] as Map<String, dynamic>),
      pendidikan: json['pendidikan'] == null
          ? null
          : Pendidikan.fromJson(json['pendidikan'] as Map<String, dynamic>),
      pekerjaan: json['pekerjaan'] == null
          ? null
          : Pekerjaan.fromJson(json['pekerjaan'] as Map<String, dynamic>),
      wargaNegara: json['warga_negara'] == null
          ? null
          : WargaNegara.fromJson(json['warga_negara'] as Map<String, dynamic>),
      golonganDarah: json['golongan_darah'] == null
          ? null
          : GolonganDarah.fromJson(
              json['golongan_darah'] as Map<String, dynamic>),
      cacat: json['cacat'] == null
          ? null
          : Cacat.fromJson(json['cacat'] as Map<String, dynamic>),
      pendudukStatus: json['penduduk_status'] == null
          ? null
          : PendudukStatus.fromJson(
              json['penduduk_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PendudukToJson(Penduduk instance) => <String, dynamic>{
      'id': instance.id,
      'config_id': instance.configId,
      'nama': instance.nama,
      'nik': instance.nik,
      'id_kk': instance.idKk,
      'kk_level': instance.kkLevel,
      'id_rtm': instance.idRtm,
      'rtm_level': instance.rtmLevel,
      'sex': instance.sex,
      'tempatlahir': instance.tempatlahir,
      'tanggallahir': instance.tanggallahir?.toIso8601String(),
      'agama_id': instance.agamaId,
      'pendidikan_kk_id': instance.pendidikanKkId,
      'pendidikan_sedang_id': instance.pendidikanSedangId,
      'pekerjaan_id': instance.pekerjaanId,
      'status_kawin': instance.statusKawin,
      'warganegara_id': instance.warganegaraId,
      'dokumen_pasport': instance.dokumenPasport,
      'dokumen_kitas': instance.dokumenKitas,
      'ayah_nik': instance.ayahNik,
      'ibu_nik': instance.ibuNik,
      'nama_ayah': instance.namaAyah,
      'nama_ibu': instance.namaIbu,
      'foto': instance.foto,
      'golongan_darah_id': instance.golonganDarahId,
      'id_cluster': instance.idCluster,
      'status': instance.status,
      'alamat_sebelumnya': instance.alamatSebelumnya,
      'alamat_sekarang': instance.alamatSekarang,
      'status_dasar': instance.statusDasar,
      'hamil': instance.hamil,
      'cacat_id': instance.cacatId,
      'sakit_menahun_id': instance.sakitMenahunId,
      'akta_lahir': instance.aktaLahir,
      'akta_perkawinan': instance.aktaPerkawinan,
      'tanggalperkawinan': instance.tanggalperkawinan,
      'akta_perceraian': instance.aktaPerceraian,
      'tanggalperceraian': instance.tanggalperceraian,
      'cara_kb_id': instance.caraKbId,
      'telepon': instance.telepon,
      'tanggal_akhir_paspor': instance.tanggalAkhirPaspor,
      'no_kk_sebelumnya': instance.noKkSebelumnya,
      'ktp_el': instance.ktpEl,
      'status_rekam': instance.statusRekam,
      'waktu_lahir': instance.waktuLahir,
      'tempat_dilahirkan': instance.tempatDilahirkan,
      'jenis_kelahiran': instance.jenisKelahiran,
      'kelahiran_anak_ke': instance.kelahiranAnakKe,
      'penolong_kelahiran': instance.penolongKelahiran,
      'berat_lahir': instance.beratLahir,
      'panjang_lahir': instance.panjangLahir,
      'tag_id_card': instance.tagIdCard,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'id_asuransi': instance.idAsuransi,
      'no_asuransi': instance.noAsuransi,
      'email': instance.email,
      'email_token': instance.emailToken,
      'email_tgl_kadaluarsa': instance.emailTglKadaluarsa,
      'email_tgl_verifikasi': instance.emailTglVerifikasi,
      'telegram': instance.telegram,
      'telegram_token': instance.telegramToken,
      'telegram_tgl_kadaluarsa': instance.telegramTglKadaluarsa,
      'telegram_tgl_verifikasi': instance.telegramTglVerifikasi,
      'bahasa_id': instance.bahasaId,
      'ket': instance.ket,
      'negara_asal': instance.negaraAsal,
      'tempat_cetak_ktp': instance.tempatCetakKtp,
      'tanggal_cetak_ktp': instance.tanggalCetakKtp,
      'suku': instance.suku,
      'bpjs_ketenagakerjaan': instance.bpjsKetenagakerjaan,
      'hubung_warga': instance.hubungWarga,
      'jenis_kelamin': instance.jenisKelamin,
      'agama': instance.agama,
      'pendidikan': instance.pendidikan,
      'pekerjaan': instance.pekerjaan,
      'warga_negara': instance.wargaNegara,
      'golongan_darah': instance.golonganDarah,
      'cacat': instance.cacat,
      'penduduk_status': instance.pendudukStatus,
    };
