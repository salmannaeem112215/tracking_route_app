import '../data/path_points.dart';
import '../data/stops.dart';

import './stop.dart';
import './location.dart';

class Track {
  final String name;
  Stops busStops = Stops([]);
  PathPoints busPath = PathPoints([]);

  Track.databas(
      {required this.name, required this.busStops, required this.busPath});

  Track({
    required this.name,
    required List<Stop> stops,
    required List<Location> path,
  }) {
    busStops.stops = stops;
    busPath.path = path;
  }
}
