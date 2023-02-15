import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_list_view.dart';
import '../../../data/track.dart';
import './stop_tile.dart';

class BusStops extends StatelessWidget {
  const BusStops({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<Track>(
      builder: (context, track, child) => CustomListView(
        title: 'Pickup Points',
        onCopy: () {},
        listView: ListView.builder(
          itemCount: track.busStops.stops.length,
          itemBuilder: (context, index) => StopTile(
            no: index + 1,
            title: track.busStops.stops[index].name,
            time: '6:30',
            isAm: true,
            onDelete: () {
              track.removeStop(index);
            },
          ),
        ),
      ),
    );
  }
}
