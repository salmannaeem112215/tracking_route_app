import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/bus_path.dart';
import '../../../components/custom_list_view.dart';
import './tracking_point_tile.dart';

class TrackingPoints extends StatelessWidget {
  const TrackingPoints({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<BusPath>(
      builder: (ctx, busPath, child) => CustomListView(
        title: 'Tracking Points',
        onCopy: busPath.copyBusPathToClipboard,
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
          },
        ),
      ),
    );
  }
}
