part of 'logout_bloc.dart';

enum PostStatus { initial, success, failure, loading }

class LogoutState extends Equatable {
  final PostStatus status;
  final String pesan;

  const LogoutState({
    this.status = PostStatus.initial,
    this.pesan = '',
  });

  LogoutState copyWith({
    PostStatus? status,
    String? pesan,
  }) {
    return LogoutState(
      status: status ?? this.status,
      pesan: pesan ?? this.pesan,
    );
  }

  @override
  List<dynamic> get props => [status, pesan];
}
