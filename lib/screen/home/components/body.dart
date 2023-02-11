import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/tracks.dart';
import '../../tracking/tracking_screen.dart';
import './track_tile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Tracks>(builder: (context, value, child) {
      final tracks = value.getTracks();

      return ListView.builder(
        itemCount: tracks.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider(
          create: (context) => tracks[index],
          child: TrackTile(
            trackName: value.getTracks()[index].name,
            totalStops: value.getTracks()[index].busStops.stops.length,
            isMoring: value.getTracks()[index].isMorning,
            onPress: () {
              Navigator.pushNamed(
                ctx,
                TrackingScreen.routeName,
                arguments: index,
              );
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
    });
  }
}
