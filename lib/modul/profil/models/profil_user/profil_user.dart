class ProfilUser {
  int? id;
  int? configId;
  String? username;
  int? idGrup;
  int? pamongId;
  String? email;
  String? lastLogin;
  dynamic emailVerifiedAt;
  int? active;
  String? nama;
  String? idTelegram;
  String? token;
  dynamic tokenExp;
  dynamic telegramVerifiedAt;
  int? notifTelegram;
  String? company;
  String? phone;
  dynamic foto;
  String? session;
  String? pamongNama;
  String? gelarDepan;
  String? gelarBelakang;
  String? pamongNip;
  String? pamongNik;
  String? pamongSex;
  String? pamongJabatan;
  int? pamongJabatanId;
  String? sebutanDesa;
  String? sebutanKecamatan;
  String? namaDesa;
  String? namaKecamatan;

  ProfilUser({
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
    this.pamongNama,
    this.gelarDepan,
    this.gelarBelakang,
    this.pamongNip,
    this.pamongNik,
    this.pamongSex,
    this.pamongJabatan,
    this.pamongJabatanId,
    this.sebutanDesa,
    this.sebutanKecamatan,
    this.namaDesa,
    this.namaKecamatan,
  });

  factory ProfilUser.fromJson(Map<dynamic, dynamic> json) => ProfilUser(
        id: json['id'] as int?,
        configId: json['config_id'] as int?,
        username: json['username'] as String?,
        idGrup: json['id_grup'] as int?,
        pamongId: json['pamong_id'] as int?,
        email: json['email'] as String?,
        lastLogin: json['last_login'] as String?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        active: json['active'] as int?,
        nama: json['nama'] as String?,
        idTelegram: json['id_telegram'] as String?,
        token: json['token'] as String?,
        tokenExp: json['token_exp'] as dynamic,
        telegramVerifiedAt: json['telegram_verified_at'] as dynamic,
        notifTelegram: json['notif_telegram'] as int?,
        company: json['company'] as String?,
        phone: json['phone'] as String?,
        foto: json['foto'] as dynamic,
        session: json['session'] as String?,
        pamongNama: json['pamong_nama'] as String?,
        gelarDepan: json['gelar_depan'] as String?,
        gelarBelakang: json['gelar_belakang'] as String?,
        pamongNip: json['pamong_nip'] as String?,
        pamongNik: json['pamong_nik'] as String?,
        pamongSex: json['pamong_sex'] as String?,
        pamongJabatan: json['pamong_jabatan'] as String?,
        pamongJabatanId: json['pamong_jabatan_id'] as int?,
        sebutanDesa: json['sebutanDesa'] as String?,
        sebutanKecamatan: json['sebutanKecamatan'] as String?,
        namaDesa: json['namaDesa'] as String?,
        namaKecamatan: json['namaKecamatan'] as String?,
      );

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'config_id': configId,
        'username': username,
        'id_grup': idGrup,
        'pamong_id': pamongId,
        'email': email,
        'last_login': lastLogin,
        'email_verified_at': emailVerifiedAt,
        'active': active,
        'nama': nama,
        'id_telegram': idTelegram,
        'token': token,
        'token_exp': tokenExp,
        'telegram_verified_at': telegramVerifiedAt,
        'notif_telegram': notifTelegram,
        'company': company,
        'phone': phone,
        'foto': foto,
        'session': session,
        'pamong_nama': pamongNama,
        'gelar_depan': gelarDepan,
        'gelar_belakang': gelarBelakang,
        'pamong_nip': pamongNip,
        'pamong_nik': pamongNik,
        'pamong_sex': pamongSex,
        'pamong_jabatan': pamongJabatan,
        'pamong_jabatan_id': pamongJabatanId,
        'sebutanDesa': sebutanDesa,
        'sebutanKecamatan': sebutanKecamatan,
        'namaDesa': namaDesa,
        'namaKecamatan': namaKecamatan,
      };
}
