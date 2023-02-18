import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapMapbox extends StatelessWidget {
  MapMapbox({super.key, required this.onMapCreated});
  final Function onMapCreated;
  final center = const LatLng(31.535922300202387, 74.3038406883341);
  String selectedStyle = 'mapbox://styles/mapbox/dark-v11';
  final darkStyle = 'mapbox://styles/mapbox/navigation-night-v1';
  final lightStyle = 'mapbox://styles/mapbox/dark-v11';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: createMap(),
    );
  }

  MapboxMap createMap() {
    selectedStyle = "mapbox://styles/mapbox/streets-v12";
    return MapboxMap(
      // styleString: selectedStyle,
      accessToken:
          'pk.eyJ1Ijoic2FsbWFuMTEyMjE1IiwiYSI6ImNsNWtvNHJ3ZjBjMXEzY21waXkyaWx0cXcifQ.wlb1Y-25-WYT9ecU9EOmRQ',
      // onMapCreated: (mapBoxController) => onMapCreated(mapBoxController),
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
      myLocationEnabled: true,
      compassEnabled: true,
      myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
      onMapClick: (point, coordinates) {
        print(coordinates);
      },
    );
  }
}
