class Location {
  final double lat;
  final double lon;

  const Location({required this.lat, required this.lon});
  const Location.latLon(this.lat, this.lon);
  const Location.lonLat(this.lon, this.lat);

  List<double> getLatLon() {
    return [lat, lon];
  }

  List<double> getLonLat() {
    return [lon, lat];
  }
}
