import 'package:flutter/material.dart';
import 'package:tracking_route_app/models/location.dart';

class PathPoints {
  PathPoints(List<Location> l) {
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

  void addLocation({required double lat, required double lon}) {
    path.add(Location(lat: lat, lon: lon));
  }

  void removeLocation(int index) {
    path.removeAt(index);
  }
}
