part of 'ganti_password_bloc.dart';

sealed class GantiPasswordEvent extends Equatable {
  const GantiPasswordEvent();

  @override
  List<Object> get props => [];
}

class PasswordChangeEvent extends GantiPasswordEvent {
  final String password;
  const PasswordChangeEvent(this.password);

  @override
  List<Object> get props => [password];
}

class PasswordBaruChangeEvent extends GantiPasswordEvent {
  final String passwordbaru;
  const PasswordBaruChangeEvent(this.passwordbaru);

  @override
  List<Object> get props => [passwordbaru];
}

class VerifPasswordBaruChangeEvent extends GantiPasswordEvent {
  final String verifpassword;
  const VerifPasswordBaruChangeEvent(this.verifpassword);

  @override
  List<Object> get props => [verifpassword];
}

class GantiPasswordSubmitEvent extends GantiPasswordEvent {
  const GantiPasswordSubmitEvent();

  @override
  List<Object> get props => [];
}
