import 'package:flutter/material.dart';
import 'package:tracking_route_app/models/location.dart';
import 'package:tracking_route_app/models/stop.dart';
import 'package:tracking_route_app/models/time.dart';
import '../models/track.dart';

class Tracks extends ChangeNotifier {
  Tracks(List<Track> t) {
    tracks = t;
  }

  List<Track> tracks = [
    // Default Tracks
    Track(name: 'Route 5 Morning', stops: [
      Stop(
        name: 'Qainchi',
        description: "Near KFC PLAZA",
        location: const Location.latLon(31.46399057144011, 74.34861657311502),
        timeOfArrival: TimeFuncs.stringToDateTime('2022-02-08 06:30:00'),
        routeNo: "5",
        isMorning: false,
      ),
      Stop(
        name: 'Pacakges Gate 3',
        description: "Near KFC PLAZA",
        location: const Location.latLon(31.472189828898024, 74.35277936151842),
        timeOfArrival: TimeFuncs.stringToDateTime('2022-02-08 06:35:00'),
        routeNo: "5",
        isMorning: false,
      ),
    ], path: [
      const Location.lonLat(74.348862, 31.464016),
      const Location.lonLat(74.348866, 31.464927),
      const Location.lonLat(74.348871, 31.465164),
      const Location.lonLat(74.348889, 31.46559),
      const Location.lonLat(74.34892, 31.465769),
      const Location.lonLat(31.472189828898024, 74.35277936151842),
    ])
  ];

  void addTrack(String trackName) {
    tracks.add(Track(name: trackName, stops: [], path: []));
    notifyListeners();
  }

  void removeTrack(int index) {
    tracks.removeAt(index);
    notifyListeners();
  }
}
