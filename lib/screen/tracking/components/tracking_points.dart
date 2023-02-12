import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_route_app/screen/tracking/components/tracking_point_tile.dart';

import '../../../components/custom_list_view.dart';
import '../../../data/track.dart';
import './stop_tile.dart';

class TrackingPoints extends StatelessWidget {
  const TrackingPoints({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<Track>(
      builder: (context, track, child) => CustomListView(
        title: 'Tracking Points',
        onCopy: () {},
        listView: ListView.builder(
          itemCount: track.busPath.path.length,
          itemBuilder: (context, index) => TrackingPointTile(
            no: index + 1,
            title: track.busPath.path[index].getLatLon().toString(),
            onDelete: () {
              track.removePathPoint(index);
            },
          ),
        ),
      ),
    );
  }
}
