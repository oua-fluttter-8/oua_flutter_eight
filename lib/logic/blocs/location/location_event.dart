abstract class LocationEvent {}

class FetchLocation extends LocationEvent {}

class FetchLocationByCity extends LocationEvent {
  final String city;

  FetchLocationByCity({required this.city});
}
