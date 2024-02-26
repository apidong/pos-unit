import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/modul/auth/models/form_model/password_model.dart';
import 'package:pos/modul/profil/models/password_baru/password_baru.dart';
import 'package:pos/modul/profil/services/profil.services.dart';
import 'package:pos/utils/services/http_service.dart';

part 'ganti_password_event.dart';
part 'ganti_password_state.dart';

class GantiPasswordBloc extends Bloc<GantiPasswordEvent, GantiPasswordState> {
  GantiPasswordBloc() : super(const GantiPasswordState()) {
    on<GantiPasswordSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
      try {
        final data = {
          'lama': state.passworBaru.value,
          'pass_baru': state.passworBaru.value,
          'pass_baru1': state.verifPassword
        };
        final response =
            await Profilservice(httpservice: HttpService()).gantiPassword(data);
        if (response['status'] == true) {
          return emit(state.copyWith(status: PostStatus.success));
        }
        emit(state.copyWith(
            status: PostStatus.failure, message: response['message']));
      } catch (e) {
        emit(state.copyWith(status: PostStatus.failure, message: e.toString()));
      }
    });

    on<PasswordChangeEvent>((event, emit) {
      final password = Password.dirty(event.password);
      emit(state.copyWith(
        password: password,
      ));
    });

    on<PasswordBaruChangeEvent>((event, emit) {
      final passwordbaru = PasswordBaru.dirty(event.passwordbaru);
      emit(state.copyWith(
        passworBaru: passwordbaru,
      ));
    });

    on<VerifPasswordBaruChangeEvent>((event, emit) {
      final verifpassword = event.verifpassword;
      emit(state.copyWith(
        verifPassword: verifpassword,
      ));
    });
  }
}
