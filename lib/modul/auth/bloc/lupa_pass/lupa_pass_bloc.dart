import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/modul/auth/models/form_model/email_model.dart';
import 'package:pos/modul/auth/services/auth.service.dart';
import 'package:pos/utils/services/http_service.dart';

part 'lupa_pass_event.dart';
part 'lupa_pass_state.dart';

class LupaPassBloc extends Bloc<LupaPassEvent, LupaPassState> {
  LupaPassBloc() : super(const LupaPassState()) {
    on<ChangeSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
      try {
        final login = await AuthService(httpservice: HttpService())
            .lupaPassword(state.email.value.toString());
        if (login['status'] == false) {
          emit(state.copyWith(
              status: PostStatus.failure, message: login['message']));
        } else {
          return emit(state.copyWith(status: PostStatus.success));
        }
        emit(state.copyWith(status: PostStatus.initial));
      } on Exception catch (e) {
        emit(state.copyWith(status: PostStatus.failure, message: e.toString()));
        emit(state.copyWith(status: PostStatus.initial));
      }
    });

    on<ChangePassEvent>((event, emit) async {
      final email = Email.dirty(event.email);
      emit(state.copyWith(
        email: email,
      ));
    });
  }
}
