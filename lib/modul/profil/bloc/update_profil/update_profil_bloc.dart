import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pos/modul/profil/models/profil_user/profil_user.dart';
import 'package:pos/modul/profil/services/profil.services.dart';
import 'package:pos/utils/services/http_service.dart';

part 'update_profil_event.dart';
part 'update_profil_state.dart';

class UpdateProfilBloc extends Bloc<UpdateProfilEvent, UpdateProfilState> {
  UpdateProfilBloc() : super(const UpdateProfilState()) {
    on<EmailChangeEvent>((event, emit) {
      final email = event.email;
      emit(state.copyWith(
        email: email,
      ));
    });

    on<NamaChangeEvent>((event, emit) {
      final nama = event.nama;
      emit(state.copyWith(
        nama: nama,
      ));
    });

    on<UpdateSubmit>((event, emit) async {
      emit(state.copyWith(submit: PostStatus.loading));
      try {
        final data = {
          'nama': state.nama,
          'email': state.email,
        };
        final response =
            await Profilservice(httpservice: HttpService()).updateProfil(data);
        if (response['status'] == true) {
          final userBox = await Hive.openBox('user');
          final user = ProfilUser.fromJson(userBox.toMap());
          user.nama = state.nama;
          user.email = state.email;
          userBox.putAll(user.toJson());

          return emit(state.copyWith(submit: PostStatus.success));
        }
        emit(state.copyWith(
            submit: PostStatus.failure, message: response['message']));
      } catch (e) {
        emit(state.copyWith(submit: PostStatus.failure, message: e.toString()));
      }
    });

    on<LoadData>((event, emit) async {
      emit(state.copyWith(status: PostStatus.loading));
      try {
        final userBox = await Hive.openBox('user');
        final user = ProfilUser.fromJson(userBox.toMap());

        return emit(state.copyWith(
            status: PostStatus.success, nama: user.nama, email: user.email));
      } catch (e) {
        emit(state.copyWith(status: PostStatus.failure, message: e.toString()));
      }
    });
  }
}
