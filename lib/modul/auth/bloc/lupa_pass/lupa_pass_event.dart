part of 'lupa_pass_bloc.dart';

class LupaPassEvent extends Equatable {
  const LupaPassEvent();

  @override
  List<Object> get props => [];
}

class ChangePassEvent extends LupaPassEvent {
  final String email;
  const ChangePassEvent(this.email);

  @override
  List<Object> get props => [email];
}

class ChangeSubmitEvent extends LupaPassEvent {
  const ChangeSubmitEvent();

  @override
  List<Object> get props => [];
}
