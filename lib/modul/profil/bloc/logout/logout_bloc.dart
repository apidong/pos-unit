import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pos/modul/profil/services/profil.services.dart';
import 'package:pos/utils/services/http_service.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(const LogoutState()) {
    on<LogoutSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
      try {
        final logout = await Profilservice(httpservice: HttpService()).logout();

        var userbox = await Hive.openBox('user');
        userbox.deleteFromDisk();
        var encryptedBox = await Hive.openBox('vaultBox');
        encryptedBox.deleteFromDisk();

        return emit(state.copyWith(status: PostStatus.success));
      } catch (e) {
        emit(state.copyWith(status: PostStatus.failure, pesan: e.toString()));
      }
    });
  }
}
