import './location.dart';
import './stop.dart';

class Stops {
  Stops(List<Stop> s) {
    stops = s;
  }
  // Stops.n() : stops = [];

  List<Stop> stops = [];

  List<Stop> getStops() {
    return stops;
  }

  void addStop({
    required String name,
    required String description,
    required Location location,
    required DateTime timeOfArrival,
    required String routeNo,
    required bool isMorning,
  }) {
    stops.add(Stop(
        name: name,
        description: description,
        location: location,
        timeOfArrival: timeOfArrival,
        routeNo: routeNo,
        isMorning: isMorning));
  }

  void removeStop(int index) {
    stops.removeAt(index);
  }
}
