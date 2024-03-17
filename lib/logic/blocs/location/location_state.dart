import 'package:oua_flutter_eight/models/location_model.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<LocationModel> locations;

  LocationLoaded({required this.locations});
}

class LocationError extends LocationState {
  final String message;

  LocationError({required this.message});
}
