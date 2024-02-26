import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/modul/pengajuan/models/pengajuan/pengajuan.dart';
import 'package:pos/modul/pengajuan/services/pengajuan.services.dart';
import 'package:pos/utils/services/http_service.dart';

part 'pengajuan_event.dart';
part 'pengajuan_state.dart';

class PengajuanBloc extends Bloc<PengajuanEvent, PengajuanState> {
  PengajuanBloc() : super(const PengajuanState()) {
    on<InitialPengajuanEvent>((event, emit) async {
      if (state.pengajuan == null) {
        emit(state.copyWith(status: PostStatus.loading));
      }

      try {
        final getPengajuan = await PengajuanServices(httpservice: HttpService()).getData(state.limit, state.page);
        if (getPengajuan['status'] == true) {
          final pengajuan = Pengajuan.fromJson(getPengajuan['data']);

          return emit(state.copyWith(
            status: PostStatus.success,
            pengajuan: pengajuan,
            page: state.page + 1,
          ));
        }
        emit(state.copyWith(status: PostStatus.failure, pesan: getPengajuan['message']));
      } catch (e) {
        state.copyWith(status: PostStatus.failure, pesan: e.toString());
      }
    });
  }
}
