part of 'periksa_pengajuan_bloc.dart';

enum PostStatus { initial, success, failure, loading }

class PeriksaPengajuanState extends Equatable {
  final PostStatus status;
  final Periksa? periksa;
  final String pesan;
  const PeriksaPengajuanState({
    this.status = PostStatus.initial,
    this.pesan = '',
    this.periksa,
  });

  @override
  List<Object> get props => [];
}

final class PeriksaPengajuanInitial extends PeriksaPengajuanState {}
