part of 'submit_periksa_bloc.dart';

enum PostStatus { initial, success, failure, loading }

class SubmitPeriksaState extends Equatable {
  final String keterangan;
  final PostStatus status;
  final String pesan;
  const SubmitPeriksaState({
    this.status = PostStatus.initial,
    this.pesan = '',
    this.keterangan = '',
  });

  SubmitPeriksaState copyWith({
    PostStatus? status,
    String? pesan,
    String? keterangan,
  }) {
    return SubmitPeriksaState(
      status: status ?? this.status,
      pesan: pesan ?? this.pesan,
      keterangan: keterangan ?? this.keterangan,
    );
  }

  @override
  List<Object> get props => [status, pesan, keterangan];
}
