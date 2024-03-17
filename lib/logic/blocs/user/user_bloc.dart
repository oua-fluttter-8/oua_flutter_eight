import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/models/user_model.dart';

import '../../repositories/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitialState()) {
    on<UserFetchEvent>(_onUserFetchEvent);
    //on<UserUpdateEvent>(_onUserUpdate);
    //on<UserDeleteEvent>(_onUserDelete);
  }

  void _onUserFetchEvent(UserFetchEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState()); // Kullanıcı yükleniyor durumunu yayınla
    final fetchedUser =
        await _userRepository.fetchUser(event.userId); // Kullanıcıyı yükle
    print(fetchedUser);
    if (fetchedUser is UserModel) {
      // Eğer kullanıcı başarıyla yüklendiyse
      emit(
          UserFetchedState(fetchedUser)); // Kullanıcı yüklendi durumunu yayınla
    } else {
      // Eğer kullanıcı yüklenemediyse
      emit(UserFetchErrorState(
          errorMessage: fetchedUser.toString())); // Hata durumunu yayınla
    }
  }
}
