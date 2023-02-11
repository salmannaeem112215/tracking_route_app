import '../data/path_points.dart';
import '../data/stops.dart';

class Track {
  final String name;
  Stops busStops;
  PathPoints busPath;

  Track({required this.name, required this.busStops, required this.busPath});
}
