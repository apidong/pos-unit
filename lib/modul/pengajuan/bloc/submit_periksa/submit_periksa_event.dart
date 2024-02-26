part of 'submit_periksa_bloc.dart';

class SubmitPeriksaEvent extends Equatable {
  const SubmitPeriksaEvent();

  @override
  List<Object> get props => [];
}

class InitialPeriksaPengajuanEvent extends SubmitPeriksaEvent {
  final String id;
  const InitialPeriksaPengajuanEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SetujuPengajuanEvent extends SubmitPeriksaEvent {
  final String id;
  const SetujuPengajuanEvent(this.id);

  @override
  List<Object> get props => [id];

  void add(SetujuPengajuanEvent setujuPengajuanEvent) {}
}

class TolakPengajuanEvent extends SubmitPeriksaEvent {
  final String id;
  final String keterangan;
  const TolakPengajuanEvent(this.id, this.keterangan);

  @override
  List<Object> get props => [id, keterangan];
}

class RevisiPengajuanEvent extends SubmitPeriksaEvent {
  final String id;
  final String keterangan;

  const RevisiPengajuanEvent(this.id, this.keterangan);

  @override
  List<Object> get props => [id, keterangan];
}
