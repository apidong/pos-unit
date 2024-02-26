part of 'lupa_pass_bloc.dart';

enum PostStatus { initial, success, failure, loading }

class LupaPassState extends Equatable {
  final PostStatus status;
  final String message;
  final Email email;

  const LupaPassState({
    this.status = PostStatus.initial,
    this.email = const Email.pure(),
    this.message = "",
  });

  LupaPassState copyWith({
    PostStatus? status,
    Email? email,
    String? message,
  }) {
    return LupaPassState(
      status: status ?? this.status,
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, email, message];
}
