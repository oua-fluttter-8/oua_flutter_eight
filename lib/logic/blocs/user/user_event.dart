import 'package:oua_flutter_eight/models/user_model.dart';

abstract class UserEvent {}

class UserUpdateEvent extends UserEvent {
  final UserModel userProfile;
  final String userId;

  UserUpdateEvent({required this.userId, required this.userProfile});
}

class UserFetchEvent extends UserEvent {
  final String userId;

  UserFetchEvent({required this.userId});
}

class AddFavoriteLocationEvent extends UserEvent {
  final String locationId;

  AddFavoriteLocationEvent({required this.locationId});
}

class DeleteFavoriteLocationEvent extends UserEvent {
  final String locationId;

  DeleteFavoriteLocationEvent({required this.locationId});
}

class UserDeleteEvent extends UserEvent {}
