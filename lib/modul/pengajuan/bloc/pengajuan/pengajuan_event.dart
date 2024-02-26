part of 'pengajuan_bloc.dart';

sealed class PengajuanEvent extends Equatable {
  const PengajuanEvent();

  @override
  List<Object> get props => [];
}

class InitialPengajuanEvent extends PengajuanEvent {
  const InitialPengajuanEvent();

  @override
  List<Object> get props => [];
}
