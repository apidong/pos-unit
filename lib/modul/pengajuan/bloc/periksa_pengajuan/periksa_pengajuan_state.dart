part of 'periksa_pengajuan_bloc.dart';

enum PostStatus { initial, success, failure, loading }

enum SubmitStatus { initial, success, failure, loading }

class PeriksaPengajuanState extends Equatable {
  final PostStatus status;
  final SubmitStatus submit;
  final Periksa? periksa;
  final String pesan;
  final String keterangan;
  const PeriksaPengajuanState({
    this.status = PostStatus.initial,
    this.submit = SubmitStatus.initial,
    this.pesan = '',
    this.periksa,
    this.keterangan = '',
  });

  PeriksaPengajuanState copyWith({
    Periksa? periksa,
    PostStatus? status,
    SubmitStatus? submit,
    String? pesan,
    String? keterangan,
  }) {
    return PeriksaPengajuanState(
      periksa: periksa,
      status: status ?? this.status,
      submit: submit ?? this.submit,
      pesan: pesan ?? this.pesan,
      keterangan: keterangan ?? this.keterangan,
    );
  }

  @override
  List<dynamic> get props => [periksa, status, pesan, keterangan, submit];
}
