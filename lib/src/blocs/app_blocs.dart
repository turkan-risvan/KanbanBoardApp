import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanbanboardapp/src/blocs/app_events.dart';
import 'package:kanbanboardapp/src/blocs/app_states.dart';
import 'package:kanbanboardapp/src/repo/repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      // Veri yükleniyor durumunu bildir
      emit(UserLoadingState());

      try {
        // UserRepository'den kullanıcı verilerini getir
        final users = await _userRepository.getUsers();
        
        // Veri yüklendi durumunu bildir
        emit(UserLoadedState(users));
      } catch (e) {
        // Hata durumunu bildir
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
