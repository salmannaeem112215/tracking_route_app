import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../functions/location_services.dart';
import '../models/location.dart';

class BusPath extends ChangeNotifier {
  BusPath(List<Location> l) {
    path = l;
  }

  List<Location> path = [];

  List<Location> getPath() {
    return path;
  }

  List<List<double>> getLatLons() {
    List<List<double>> latLons = [];
    for (var i = 0; i < path.length; i++) {
      latLons.add(path[i].getLatLon());
    }
    return latLons;
  }

  List<List<double>> getLonLats() {
    List<List<double>> lonLat = [];
    for (var i = 0; i < path.length; i++) {
      lonLat.add(path[i].getLonLat());
    }
    return lonLat;
  }

  void addLocation() {
    path.add(Location(lat: 34, lon: 37));
    notifyListeners();
  }

  void removeLocation(int index) {
    path.removeAt(index);
    notifyListeners();
  }

  void clearLocations() {
    path.clear();
    notifyListeners();
  }

  Future<void> copyBusPathToClipboard() async {
    print('Copy To Clipboard');
    Position position = await LocationServices.determinePosition();
    final positionDetails = LocationServices.getPositionDetails(position);
    print(positionDetails);
  }
}
