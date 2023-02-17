import 'dart:async';

import 'package:flutter/material.dart';

class TrackingClass {
  bool isTracking = false;
  int trackIndex = -1;
  Timer? _timer;

  void startTimer(Duration duration, VoidCallback func) {
    if (_timer == null) {
      // No Other Tracking Is Active
      _timer = Timer.periodic(duration, (timer) {
        // ignore: avoid_print
        print('Hello world!');
        func();
      });
    } else {
      // Other Tracking is Active
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

  static startTracking(int trackIndex, Duration d, VoidCallback func) {
    tracking.trackIndex = trackIndex;
    tracking.isTracking = true;
    tracking.startTimer(d, func);
  }

  static stopTracking() {
    tracking.trackIndex = -1;
    tracking.isTracking = false;
    tracking.stopTimer();
  }
}
