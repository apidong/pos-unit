part of 'profil_user_bloc.dart';

enum PostStatus { initial, success, failure, loading }

class ProfilUserState extends Equatable {
  final ProfilUser? profilUser;
  final PostStatus status;
  final String pesan;
  final dynamic urlfoto;

  const ProfilUserState({
    this.profilUser,
    this.status = PostStatus.initial,
    this.pesan = '',
    this.urlfoto = '',
  });

  ProfilUserState copyWith({
    ProfilUser? profilUser,
    PostStatus? status,
    String? pesan,
    String? urlfoto,
  }) {
    return ProfilUserState(
      profilUser: profilUser ?? this.profilUser,
      status: status ?? this.status,
      pesan: pesan ?? this.pesan,
      urlfoto: urlfoto ?? this.urlfoto,
    );
  }

  @override
  List<dynamic> get props => [status, profilUser, pesan, urlfoto];
}
