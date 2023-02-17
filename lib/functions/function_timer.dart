import 'dart:async';

import 'package:flutter/material.dart';

class FunctionTimer {
  Timer? _timer;

  void start(Duration duration, VoidCallback func) {
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

  void stop() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
