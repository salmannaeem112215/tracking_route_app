import 'package:flutter/material.dart';
import 'dart:async';

class Prompt {
  static Future<Duration?> promptDuration(BuildContext context) async {
    Duration? duration;
    bool valueEnter = false;
    // This Will Check a string is valid number or not

    void validUpdateDuration(String? value) {
      // Exceute only if all is Numeric Values
      if (_isNumeric(value)) {
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

  static bool _isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
