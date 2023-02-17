import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_route_app/data/path_points.dart';
import 'package:tracking_route_app/screen/tracking/components/tracking_point_tile.dart';

import '../../../components/custom_list_view.dart';
import '../../../data/track.dart';
import '../../../data/tracks.dart';

class TrackingPoints extends StatelessWidget {
  const TrackingPoints({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final track = Provider.of<Tracks>(listen: false, context).getTrackAt(index);

    print('Tracking Points');

    return Consumer<PathPoints>(
      builder: (ctx, busPath, child) => CustomListView(
        title: 'Tracking Points',
        onCopy: () {},
        onDelete: busPath.clearLocations,
        listView: ListView.builder(
            itemCount: busPath.path.length,
            itemBuilder: (context, index) {
              return TrackingPointTile(
                no: index + 1,
                title: busPath.path[index].getLatLon().toString(),
                onDelete: () {
                  busPath.removeLocation(index);
                },
              );
            }),
      ),
    );
  }
}
