import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/location_repository.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository _locationRepository;
  LocationBloc(this._locationRepository) : super(LocationInitial()) {
    on<FetchLocation>(_onFetchLocation);
  }

  FutureOr<void> _onFetchLocation(
      FetchLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    final locationList = await _locationRepository.fetchLocations();
    if (locationList.isNotEmpty) {
      emit(LocationLoaded(locations: locationList));
    } else {
      emit(LocationError(message: 'No locations found'));
    }
  }
}
