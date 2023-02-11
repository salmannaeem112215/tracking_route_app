import './location.dart';

class Stop {
  final String name;
  final String description;
  final Location location;
  final DateTime timeOfArrival;
  final String routeNo;
  final bool isMorning;

  Stop.latLon({
    required this.name,
    required this.description,
    required double lat,
    required double lon,
    required this.timeOfArrival,
    required this.routeNo,
    required this.isMorning,
  }) : location = Location(lat: lat, lon: lon);
  Stop({
    required this.name,
    required this.description,
    required this.location,
    required this.timeOfArrival,
    required this.routeNo,
    required this.isMorning,
  });
}
