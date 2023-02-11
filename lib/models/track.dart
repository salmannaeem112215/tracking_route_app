import '../data/path_points.dart';
import '../data/stops.dart';

import './stop.dart';
import './location.dart';

class Track {
  final String name;
  final bool isMorning;
  Stops busStops = Stops([]);
  PathPoints busPath = PathPoints([]);

  Track.databas(
      {required this.name,
      required this.busStops,
      required this.busPath,
      required this.isMorning});

  Track({
    required this.name,
    required this.isMorning,
    required List<Stop> stops,
    required List<Location> path,
  }) {
    busStops.stops = stops;
    busPath.path = path;
  }

  bool isMatched(String trackName, bool trackIsMoring) {
    return (name == trackName && isMorning == trackIsMoring);
  }
}
