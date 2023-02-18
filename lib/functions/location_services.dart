import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/location.dart';

class LocationServices {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      timeLimit: Duration(seconds: 10),
    );
  }

  static double getKmphSpeed(double mpsSpeed) {
    return mpsSpeed * 3.6;
  }

  static String printPositionDetails(Position position) {
    double speed = position.speed;
    String details = "";
    details += '${position.latitude},${position.longitude}\n';
    details += 'Speed ${speed}\n';
    details += 'KMP Speed ${speed * 3.6}\n';

    details += 'Accuracy  ${position.accuracy}\n';
    details += 'Altitude  ${position.altitude}\n';
    details += 'Floor  ${position.floor}\n';
    details += 'Heading  ${position.heading}\n';
    details += 'isMocked  ${position.isMocked}\n';
    details += 'Speed Accuracy  ${position.speedAccuracy}\n';
    details += 'TimeStamp  ${position.timestamp}\n';

    return details;
  }

  static String getPositionDetails(Position position) {
    double speed = position.speed;
    String details = "";
    details += '${position.latitude},${position.longitude}\n';
    details += 'Speed ${position.speed}\n';
    details += 'Speed ${speed}\n';
    details += 'KMP Speed ${speed * 3.6}\n';
    details += 'Altitude  ${position.altitude}\n';
    details += 'Heading  ${position.heading}\n';
    details += 'TimeStamp  ${position.timestamp}\n';

    return details;
  }
}
