import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'foto_user_event.dart';
part 'foto_user_state.dart';

class FotoUserBloc extends Bloc<FotoUserEvent, FotoUserState> {
  FotoUserBloc() : super(FotoUserInitial()) {
    on<FotoUserEvent>((event, emit) {});
  }
}
