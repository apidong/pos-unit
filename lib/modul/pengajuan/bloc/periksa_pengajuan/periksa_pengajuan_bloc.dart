import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/modul/pengajuan/models/periksa/periksa.pengajuan.dart';

part 'periksa_pengajuan_event.dart';
part 'periksa_pengajuan_state.dart';

class PeriksaPengajuanBloc extends Bloc<PeriksaPengajuanEvent, PeriksaPengajuanState> {
  PeriksaPengajuanBloc() : super(PeriksaPengajuanInitial()) {
    on<InitialPeriksaPengajuanEvent>((event, emit) {});
  }
}
