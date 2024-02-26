part of 'update_profil_bloc.dart';

enum PostStatus { initial, success, failure, loading }

class UpdateProfilState extends Equatable {
  final String email;
  final String nama;
  final PostStatus status;
  final PostStatus submit;
  final String message;

  const UpdateProfilState({
    this.email = '',
    this.nama = '',
    this.status = PostStatus.initial,
    this.submit = PostStatus.initial,
    this.message = "",
  });

  UpdateProfilState copyWith({
    String? email,
    String? nama,
    PostStatus? status,
    PostStatus? submit,
    String? message,
  }) {
    return UpdateProfilState(
      status: status ?? this.status,
      submit: submit ?? this.submit,
      email: email ?? this.email,
      nama: nama ?? this.nama,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, email, message, nama, submit];
}
