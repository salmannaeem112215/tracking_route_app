import 'package:flutter/material.dart';

import '../models/path_points.dart';

import '../models/stop.dart';
import '../models/location.dart';
import '../models/stops.dart';

class Track extends ChangeNotifier {
  final String name;
  final bool isMorning;
  Stops busStops = Stops([]);
  PathPoints busPath = PathPoints([]);
  Track.n()
      : name = '',
        isMorning = true;
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

  void addStop(
      {required String title,
      required Location location,
      required DateTime timeOfArrival,
      required String routeNo,
      required bool isMorning,
      String description = ""}) {
    busStops.stops.add(Stop(
      name: title,
      description: description,
      location: location,
      timeOfArrival: timeOfArrival,
      routeNo: routeNo,
      isMorning: isMorning,
    ));
    notifyListeners();
    print('Notify Listner');
  }

  void removeStop(int index) {
    busStops.stops.removeAt(index);
    notifyListeners();
  }
}
