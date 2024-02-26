import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos/modul/profil/models/profil_user/profil_user.dart';
import 'package:pos/modul/profil/services/profil.services.dart';
import 'package:pos/utils/services/http_service.dart';

part 'profil_user_event.dart';
part 'profil_user_state.dart';

class ProfilUserBloc extends Bloc<ProfilUserEvent, ProfilUserState> {
  ProfilUserBloc() : super(const ProfilUserState()) {
    on<ProfilUserEvent>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
      try {
        final userBox = await Hive.openBox('user');
        final user = ProfilUser.fromJson(userBox.toMap());

        final foto =
            await Profilservice(httpservice: HttpService()).foto(user.nama);

        return emit(
          state.copyWith(
            status: PostStatus.success,
            profilUser: user,
            urlfoto: foto['data'],
          ),
        );
      } catch (e) {
        state.copyWith(status: PostStatus.failure, pesan: e.toString());
      }
    });
  }
}
