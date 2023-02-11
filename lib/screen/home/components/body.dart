import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_route_app/data/tracks.dart';

import './track_tile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Tracks>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.getTracks().length,
        itemBuilder: (context, index) => TrackTile(
          trackName: value.getTracks()[index].name,
          totalStops: value.getTracks()[index].busStops.stops.length,
          isMoring: value.getTracks()[index].isMorning,
          onPress: () {
            // ignore: avoid_print
            print('Track Data File');
          },
          onDelete: () {
            value.removeTrack(index);
          },
          onUpload: () {
            // ignore: avoid_print
            print('Uploading Data to Firebase');
          },
          // Default Values
        ),
      ),
    );
  }
}
