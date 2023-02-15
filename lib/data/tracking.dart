import 'package:flutter/material.dart';
import 'dart:async';

class TrackingClass {
  bool isTracking = false;
  int track_index = -1;
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
      track_index = -1;
      _timer!.cancel();
      _timer = null;
    }
  }

// Define the function to be executed after each interval
  void printMessage() {
    print('Hello world!');
  }

// Schedule the function to be called repeatedly after each interval
  // void scheduleFunction() {
  //   timer = Timer.periodic(Duration(seconds: 2), (timer) {
  //     print('scehdule Function');
  //     printMessage();
  //   });
  // }

  // void startTracking(int t_index) {
  //   if (track_index != -1) {
  //     // Some Route is tracking
  //     print('$track_index is active right now');
  //   } else {
  //     // No Route Tracking is Active
  //     track_index = t_index;
  //     isTracking = true;
  //     // Function That will be called
  //     scheduleFunction();
  //   }
  // }

  // void stopTracking() {
  //   print('Tracking End');
  //   track_index = -1;
  //   timer.cancel();
  // }
}

class Tracking {
  static TrackingClass tracking = TrackingClass();

  static startTracking(int t_index, Duration d) {
    tracking.track_index = t_index;
    tracking.isTracking = true;
    tracking.startTimer(d);
  }

  static stopTracking() {
    tracking.track_index = -1;
    tracking.isTracking = false;
    tracking.stopTimer();
  }

  static Future<Duration?> promptDuration(BuildContext context) async {
    Duration? duration;
    bool valueEnter = false;
    // This Will Check a string is valid number or not
    bool isNumeric(String? str) {
      if (str == null) {
        return false;
      }
      return double.tryParse(str) != null;
    }

    void validUpdateDuration(String? value) {
      // Exceute only if all is Numeric Values
      if (isNumeric(value)) {
        int sec = int.parse(value!);
        // Give Duration only if it is between 1 minute
        if (sec > 1 && sec < 60) {
          duration = Duration(seconds: int.parse(value));
        }
      }
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter duration'),
          content: TextField(
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Duration in seconds',
            ),
            onChanged: validUpdateDuration,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                valueEnter = true;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    if (valueEnter) {
      return duration;
    } else {
      return null;
    }
  }
}
