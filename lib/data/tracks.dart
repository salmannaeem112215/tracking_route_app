import 'package:flutter/material.dart';
import 'package:tracking_route_app/models/location.dart';
import 'package:tracking_route_app/models/stop.dart';
import 'package:tracking_route_app/models/time.dart';
import '../models/track.dart';

class Tracks extends ChangeNotifier {
  Tracks.database(List<Track> t) {
    _tracks = t;
  }
  Tracks();

  List<Track> _tracks = [
    // Default Track 1
    Track(
      name: 'Route 5',
      isMorning: true,
      stops: [
        Stop(
          name: 'Qainchi',
          description: "Near KFC PLAZA",
          location: const Location.latLon(31.46399057144011, 74.34861657311502),
          timeOfArrival: TimeFuncs.stringToDateTime('2022-02-08 06:30:00'),
          routeNo: "5",
          isMorning: true,
        ),
        Stop(
          name: 'Pacakges Gate 3',
          description: "Near KFC PLAZA",
          location:
              const Location.latLon(31.472189828898024, 74.35277936151842),
          timeOfArrival: TimeFuncs.stringToDateTime('2022-02-08 06:35:00'),
          routeNo: "5",
          isMorning: true,
        ),
      ],
      path: [
        const Location.lonLat(74.348862, 31.464016),
        const Location.lonLat(74.348866, 31.464927),
        const Location.lonLat(74.348871, 31.465164),
        const Location.lonLat(74.348889, 31.46559),
        const Location.lonLat(74.34892, 31.465769),
        const Location.lonLat(31.472189828898024, 74.35277936151842),
      ],
    ),
    // Default Track 2
    Track(
      name: 'Route 5',
      isMorning: false,
      stops: [
        Stop(
          name: 'Pacakges Gate 3',
          description: "Near KFC PLAZA",
          location:
              const Location.latLon(31.472189828898024, 74.35277936151842),
          timeOfArrival: TimeFuncs.stringToDateTime('2022-02-08 18:35:00'),
          routeNo: "5",
          isMorning: false,
        ),
        Stop(
          name: 'Qainchi',
          description: "Near KFC PLAZA",
          location: const Location.latLon(31.46399057144011, 74.34861657311502),
          timeOfArrival: TimeFuncs.stringToDateTime('2022-02-08 18:35:00'),
          routeNo: "5",
          isMorning: false,
        ),
      ],
      path: [
        const Location.lonLat(74.348862, 31.464016),
        const Location.lonLat(74.348866, 31.464927),
        const Location.lonLat(74.348871, 31.465164),
        const Location.lonLat(74.348889, 31.46559),
        const Location.lonLat(74.34892, 31.465769),
        const Location.lonLat(31.472189828898024, 74.35277936151842),
      ],
    )
  ];

  List<Track> getTracks() {
    return _tracks;
  }

  void addTrack({required String trackName, required bool isMorning}) {
    int counter = trackExist(trackName, isMorning);
    if (counter != 0) {
      trackName += '_$counter'; // route 5_1
    }
    _tracks
        .add(Track(name: trackName, isMorning: isMorning, stops: [], path: []));
    notifyListeners();
  }

  // return the digit that tell how many time it and it's copy exist
  int trackExist(String name, bool isMorning, {int count = 0}) {
    String _name = name;
    int count = 0;
    for (int i = 0; i < _tracks.length; i++) {
      if (_tracks[i].isMatched(_name, isMorning)) {
        count++;
        _name = '${name}_$count';
      }
    }
    return count;
  }

  void removeTrack(int index) {
    _tracks.removeAt(index);
    notifyListeners();
  }
}
