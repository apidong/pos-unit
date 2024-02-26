part of 'pengajuan_bloc.dart';

enum PostStatus { initial, success, failure, loading }

class PengajuanState extends Equatable {
  final Pengajuan? pengajuan;
  final PostStatus status;
  final String pesan;
  final int limit;
  final bool hasreachedMax;
  final int page;

  const PengajuanState({
    this.pengajuan,
    this.status = PostStatus.initial,
    this.pesan = '',
    this.limit = 50,
    this.page = 0,
    this.hasreachedMax = false,
  });

  PengajuanState copyWith({
    Pengajuan? pengajuan,
    PostStatus? status,
    String? pesan,
    bool? hasreachedMax,
    int? limit,
    int? page,
  }) {
    return PengajuanState(
      pengajuan: pengajuan,
      status: status ?? this.status,
      hasreachedMax: hasreachedMax ?? this.hasreachedMax,
      pesan: pesan ?? this.pesan,
      page: page ?? this.page,
    );
  }

  @override
  List<dynamic> get props => [status, pengajuan, pesan, hasreachedMax];
}
