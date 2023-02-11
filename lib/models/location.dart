class Location {
  final double lat;
  final double lon;

  const Location({required this.lat, required this.lon});

  List<double> getLatLon() {
    return [lat, lon];
  }

  List<double> getLonLat() {
    return [lon, lat];
  }
}
