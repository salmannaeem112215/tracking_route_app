import './location.dart';

class Stop {
  final String name;
  final String description;
  final Location location;
  final DateTime timeOfArrival;
  final String routeNo;
  final bool isMorning;

  const Stop({
    required this.name,
    required this.description,
    required this.location,
    required this.timeOfArrival,
    required this.routeNo,
    required this.isMorning,
  });
}
