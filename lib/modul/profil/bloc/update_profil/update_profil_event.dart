part of 'update_profil_bloc.dart';

sealed class UpdateProfilEvent extends Equatable {
  const UpdateProfilEvent();

  @override
  List<Object> get props => [];
}

class EmailChangeEvent extends UpdateProfilEvent {
  final String email;
  const EmailChangeEvent(this.email);

  @override
  List<Object> get props => [email];
}

class NamaChangeEvent extends UpdateProfilEvent {
  final String nama;
  const NamaChangeEvent(this.nama);

  @override
  List<Object> get props => [nama];
}

class UpdateSubmit extends UpdateProfilEvent {
  const UpdateSubmit();

  @override
  List<Object> get props => [];
}

class LoadData extends UpdateProfilEvent {
  const LoadData();

  @override
  List<Object> get props => [];
}
