import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/logic/repositories/auth_repository.dart';
import 'package:oua_flutter_eight/models/user_model.dart';
import '../../repositories/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitialState()) {
    on<UserFetchEvent>(_onUserFetchEvent);
    on<UserUpdateEvent>(_onUserUpdateEvent);
    on<UserDeleteEvent>(_onUserDeleteEvent);
    on<AddFavoriteLocationEvent>(_onAddFavoriteLocationEvent);
    on<DeleteFavoriteLocationEvent>(_onDeleteFavoriteLocationEvent);
  }

  void _onUserFetchEvent(UserFetchEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState()); // Kullanıcı yükleniyor durumunu yayınla
    final fetchedUser =
        await _userRepository.fetchUser(event.userId); // Kullanıcıyı yükle
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

  void _onUserUpdateEvent(
      UserUpdateEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState()); // Kullanıcı güncelleniyor durumunu yayınla

    try {
      await _userRepository.updateUser(
          event.userProfile, event.userId); // Kullanıcıyı güncelle

      emit(UserInitialState()); // Kullanıcı başlangıç durumunu yayınla
    } catch (e) {
      // Hata oluştuğunda

      emit(UserUpdateErrorState(
          updateErrorMessage: e.toString())); // Hata durumunu yayınla
    }
  }

  void _onUserDeleteEvent(UserDeleteEvent event, Emitter<UserState> emit) {
    emit(UserInitialState());
  }

  Future<void> _onAddFavoriteLocationEvent(
      AddFavoriteLocationEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState());
    AuthRepository authRepository = AuthRepository();
    final userId = authRepository.getUserId();
    _userRepository.addFavoriteLocation(userId!, event.locationId);
    emit(UserInitialState());
  }

  Future<void> _onDeleteFavoriteLocationEvent(
      DeleteFavoriteLocationEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState());
    AuthRepository authRepository = AuthRepository();
    final userId = authRepository.getUserId();
    _userRepository.deleteFavoriteLocation(userId!, event.locationId);
    emit(UserInitialState());
  }
}
