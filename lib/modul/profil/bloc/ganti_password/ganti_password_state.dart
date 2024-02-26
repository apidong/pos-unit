part of 'ganti_password_bloc.dart';

enum PostStatus { initial, success, failure, loading }

class GantiPasswordState extends Equatable {
  final Password password;
  final PasswordBaru passworBaru;
  final String verifPassword;
  final PostStatus status;
  final String message;

  const GantiPasswordState({
    this.password = const Password.pure(),
    this.passworBaru = const PasswordBaru.pure(),
    this.verifPassword = "",
    this.status = PostStatus.initial,
    this.message = "",
  });

  GantiPasswordState copyWith({
    PasswordBaru? passworBaru,
    Password? password,
    String? verifPassword,
    PostStatus? status,
    String? message,
  }) {
    return GantiPasswordState(
      status: status ?? this.status,
      verifPassword: verifPassword ?? this.verifPassword,
      password: password ?? this.password,
      passworBaru: passworBaru ?? this.passworBaru,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props =>
      [status, password, message, verifPassword, passworBaru];
}
