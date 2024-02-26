import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/modul/pengajuan/models/periksa/periksa.pengajuan.dart';
import 'package:pos/modul/pengajuan/services/pengajuan.services.dart';
import 'package:pos/utils/services/http_service.dart';

part 'periksa_pengajuan_event.dart';
part 'periksa_pengajuan_state.dart';

class PeriksaPengajuanBloc extends Bloc<PeriksaPengajuanEvent, PeriksaPengajuanState> {
  PeriksaPengajuanBloc() : super(const PeriksaPengajuanState()) {
    on<InitialPeriksaPengajuanEvent>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
      try {
        final showPeriksa = await PengajuanServices(httpservice: HttpService()).getDatarinci(event.id);

        if (showPeriksa['status'] == true) {
          final periksa = Periksa.fromJson(showPeriksa['data']);
          return emit(state.copyWith(status: PostStatus.success, periksa: periksa));
        }
        emit(state.copyWith(status: PostStatus.failure, pesan: showPeriksa['message']));
      } catch (e) {
        emit(state.copyWith(status: PostStatus.failure, pesan: e.toString()));
      }
    });

    on<TolakPengajuanEvent>((event, emit) async {
      emit(state.copyWith(submit: SubmitStatus.loading));
      try {
        final tolak = await PengajuanServices(httpservice: HttpService()).tolak(event.id, event.keterangan.toString());

        if (tolak['status'] == true) {
          return emit(state.copyWith(submit: SubmitStatus.success));
        }
        emit(state.copyWith(submit: SubmitStatus.failure, pesan: tolak['message']));
      } catch (e) {
        emit(state.copyWith(submit: SubmitStatus.failure, pesan: e.toString()));
      }
    });

    on<SetujuPengajuanEvent>((event, emit) async {
      emit(state.copyWith(submit: SubmitStatus.loading));
      try {
        final setuju = await PengajuanServices(httpservice: HttpService()).setuju(event.id);
        print('periksa');
        print(setuju['status']);
        print(setuju['status'] == true);
        if (setuju['status'] == true) {
          return emit(state.copyWith(submit: SubmitStatus.success));
        }
        return emit(state.copyWith(submit: SubmitStatus.failure, pesan: setuju['message']));
      } catch (e) {
        return emit(state.copyWith(submit: SubmitStatus.failure, pesan: e.toString()));
      }
    });

    on<RevisiPengajuanEvent>((event, emit) async {
      emit(state.copyWith(submit: SubmitStatus.loading));
      try {
        final revisi = await PengajuanServices(httpservice: HttpService()).revisi(event.id, event.keterangan);

        if (revisi['status'] == true) {
          return emit(state.copyWith(status: PostStatus.success));
        }
        emit(state.copyWith(status: PostStatus.failure, pesan: revisi['message']));
      } catch (e) {
        emit(state.copyWith(status: PostStatus.failure, pesan: e.toString()));
      }
    });
  }
}
