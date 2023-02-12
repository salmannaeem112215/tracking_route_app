import 'package:flutter/material.dart';
import 'package:tracking_route_app/models/location.dart';
import 'package:tracking_route_app/models/stop.dart';
import 'package:tracking_route_app/models/time.dart';
import 'track.dart';

class Tracks extends ChangeNotifier {
  List<Track> _tracks = [
    // Default Track 1
    Track(
      name: '5',
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
      name: '5',
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

  //Getter
  // get Track List
  List<Track> getTracks() {
    return _tracks;
  }

  // get Track With Name
  Track getTrack(String name, bool isMorning) {
    final track =
        _tracks.firstWhere((element) => element.isMatched(name, isMorning));

    return track;
  }

  Track getTrackAt(int index) {
    final track = _tracks.elementAt(index);
    return track;
  }
  ////////////////////////////
  // CRUD OPERATIONS
  ///////////////////////////

  // Add Track in Track List
  void addTrack({required String trackName, required bool isMorning}) {
    // getting counter value
    int counter = getCounter(trackName, isMorning);

    // 0 means new Name so no need to change name
    if (counter != 0) {
      trackName = _counterFormat(trackName, counter); // route 5_1
    }

    // Add Track in Track List
    _tracks
        .add(Track(name: trackName, isMorning: isMorning, stops: [], path: []));
    notifyListeners();
  }

  // Remove Track from TrackList
  void removeTrack(int index) {
    _tracks.removeAt(index);
    notifyListeners();
  }

  //////////////////////
  // Utility Functions
  //////////////////////

  // This function takes route name and counter to return a format
  String _counterFormat(String name, int count) {
    return '$name ($count)';
  }

  // return the counter value for new Track to be add
  int getCounter(String name, bool isMorning, {int count = 0}) {
    String counterName = name;
    int count = 0;

    // Iterate for each Item in Tracks
    for (int i = 0; i < _tracks.length; i++) {
      if (_tracks[i].isMatched(counterName, isMorning)) {
        count++;
        counterName = _counterFormat(name, count);
      }
    }

    // Return counter value
    return count;
  }
}
