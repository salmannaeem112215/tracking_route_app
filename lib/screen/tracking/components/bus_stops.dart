import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tracking_route_app/data/tracks.dart';
import 'package:tracking_route_app/data/track.dart';
import './stop_tile.dart';

class BusStops extends StatelessWidget {
  const BusStops({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final track = Provider.of<Tracks>(context, listen: false).getTrackAt(index);
    return Consumer<Track>(
      builder: (context, track, child) => ListView.builder(
        itemCount: track.busStops.stops.length,
        itemBuilder: (context, index) => StopTile(
          no: index + 1,
          title: track.busStops.stops[index].name,
          time: '6:30',
          isAm: true,
          onDelete: () {
            print('Delte Start');
            track.busStops.removeStop(index);
            print('Delte End');
          },
        ),
      ),
    );
  }
}
