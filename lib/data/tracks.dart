import 'package:flutter/material.dart';
import 'package:tracking_route_app/data/path_points.dart';
import 'package:tracking_route_app/data/stops.dart';
import '../models/track.dart';

class Tracks extends ChangeNotifier {
  Tracks(List<Track> t) {
    tracks = t;
  }

  List<Track> tracks = [];

  void addTrack(String trackName) {
    tracks.add(
        Track(name: trackName, busStops: Stops([]), busPath: PathPoints([])));

    notifyListeners();
  }

  void removeTrack(int index) {
    tracks.removeAt(index);
    notifyListeners();
  }
}
