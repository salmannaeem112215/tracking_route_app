import 'package:flutter/material.dart';
import 'dart:async';

class TrackingClass {
  bool isTracking = false;
  int trackIndex = -1;
  Timer? _timer = null;

  void startTimer(Duration duration) {
    if (_timer == null) {
      _timer = Timer.periodic(duration, (timer) {
        print('Hello world!');
      });
    }
  }

  void stopTimer() {
    if (_timer != null) {
      trackIndex = -1;
      _timer!.cancel();
      _timer = null;
    }
  }
}

class Tracking {
  static TrackingClass tracking = TrackingClass();

  static startTracking(int trackIndex, Duration d) {
    tracking.trackIndex = trackIndex;
    tracking.isTracking = true;
    tracking.startTimer(d);
  }

  static stopTracking() {
    tracking.trackIndex = -1;
    tracking.isTracking = false;
    tracking.stopTimer();
  }
}
