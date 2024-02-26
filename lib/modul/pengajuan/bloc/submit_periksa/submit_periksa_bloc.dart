import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pos/modul/pengajuan/bloc/periksa_pengajuan/periksa_pengajuan_bloc.dart';
import 'package:pos/modul/pengajuan/services/pengajuan.services.dart';
import 'package:pos/utils/services/http_service.dart';

part 'submit_periksa_event.dart';
part 'submit_periksa_state.dart';

class SubmitPeriksaBloc extends Bloc<SubmitPeriksaEvent, SubmitPeriksaState> {
  SubmitPeriksaBloc() : super(SubmitPeriksaState()) {
    on<TolakPengajuanEvent>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
      try {
        final tolak = await PengajuanServices(httpservice: HttpService()).tolak(event.id, event.keterangan.toString());

        if (tolak['status'] == true) {
          return emit(state.copyWith(status: PostStatus.success));
        }
        emit(state.copyWith(status: PostStatus.failure, pesan: tolak['message']));
      } catch (e) {
        emit(state.copyWith(status: PostStatus.failure, pesan: e.toString()));
      }
    });

    on<SetujuPengajuanEvent>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
      try {
        final setuju = await PengajuanServices(httpservice: HttpService()).setuju(event.id);
        print('periksa');
        print(setuju['status']);
        print(setuju['status'] == true);
        if (setuju['status'] == true) {
          emit(state.copyWith(status: PostStatus.success));
          print(state);
          return;
        }
        return emit(state.copyWith(status: PostStatus.failure, pesan: setuju['message']));
      } catch (e) {
        return emit(state.copyWith(status: PostStatus.failure, pesan: e.toString()));
      }
    });

    on<RevisiPengajuanEvent>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
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
