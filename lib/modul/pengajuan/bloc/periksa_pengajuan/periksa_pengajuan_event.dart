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
