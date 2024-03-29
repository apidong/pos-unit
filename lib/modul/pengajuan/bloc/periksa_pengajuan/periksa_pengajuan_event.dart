part of 'periksa_pengajuan_bloc.dart';

sealed class PeriksaPengajuanEvent extends Equatable {
  const PeriksaPengajuanEvent();

  @override
  List<Object> get props => [];
}

class InitialPeriksaPengajuanEvent extends PeriksaPengajuanEvent {
  final String id;
  const InitialPeriksaPengajuanEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SetujuPengajuanEvent extends PeriksaPengajuanEvent {
  final String id;
  const SetujuPengajuanEvent(this.id);

  @override
  List<Object> get props => [id];
}

class TolakPengajuanEvent extends PeriksaPengajuanEvent {
  final String id;
  final String keterangan;
  const TolakPengajuanEvent(this.id, this.keterangan);

  @override
  List<Object> get props => [id, keterangan];
}

class RevisiPengajuanEvent extends PeriksaPengajuanEvent {
  final String id;
  final String keterangan;

  const RevisiPengajuanEvent(this.id, this.keterangan);

  @override
  List<Object> get props => [id, keterangan];
}
