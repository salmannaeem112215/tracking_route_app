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
          onPress: () {},
          onDelete: () {},
          onUpload: () {},
          // Default Values
          date: '2021-02-01',
          time: '06:30 AM',
        ),
      ),
    );
  }
}
