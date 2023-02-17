import 'package:flutter/material.dart';
import '../functions/function_timer.dart';

class Tracking {
  static FunctionTimer funcTimer = FunctionTimer();
  static bool isTracking = false;
  static int trackIndex = -1;

  static startTracking(int tIndex, Duration duration, VoidCallback func) {
    trackIndex = tIndex;
    isTracking = true;
    funcTimer.start(duration, func);
  }

  static stopTracking() {
    trackIndex = -1;
    isTracking = false;
    funcTimer.stop();
  }
}
