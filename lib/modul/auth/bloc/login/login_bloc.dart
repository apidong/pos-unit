import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pos/modul/auth/models/form_model/form_model.dart';
import 'package:pos/modul/auth/services/auth.service.dart';
import 'package:pos/utils/services/http_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUsernameChanged>((event, emit) {
      final username = Username.dirty(event.username);
      emit(state.copyWith(
        username: username,
        // status: Formz.validate([state.password, username]),
      ));
    });

    on<LoginPasswordChanged>((event, emit) {
      final password = Password.dirty(event.password);
      emit(state.copyWith(
        password: password,
        // status: Formz.validate([password, state.username]) ? FormzSubmissionStatus.success : FormzSubmissionStatus.failure,
      ));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final login = await AuthService(httpservice: HttpService())
            .login(state.username.value, state.password.value);
        if (login['status'] == false) {
          emit(state.copyWith(
              status: FormzSubmissionStatus.failure,
              message: login['message']));
        } else {
          return emit(state.copyWith(status: FormzSubmissionStatus.success));
        }
        emit(state.copyWith(status: FormzSubmissionStatus.initial));
      } on Exception catch (e) {
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure, message: e.toString()));
        emit(state.copyWith(status: FormzSubmissionStatus.initial));
      }
    });
  }
}
