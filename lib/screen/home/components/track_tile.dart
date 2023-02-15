import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tracking_route_app/screen/home/components/track_tile_front.dart';

import '../../../data/tracks.dart';

class TrackTile extends StatelessWidget {
  const TrackTile({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Slidable(
        endActionPane: buttons(),
        child: TrackTileFront(
          index: index,
        ),
      ),
    );
  }

  ActionPane buttons() {
    return ActionPane(motion: const StretchMotion(), children: [
      // Upload Button
      SlidableAction(
        onPressed: (ctx) => () {
          // ignore: avoid_print
          print('upload Button press');
        },
        icon: Icons.cloud_upload_rounded,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade300,
      ),
      // Delete Button
      SlidableAction(
        onPressed: (ctx) {
          Provider.of<Tracks>(ctx, listen: false).removeTrack(index);
        },
        icon: Icons.delete,
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(10)),
        backgroundColor: Colors.red.shade500,
      )
    ]);
  }
}
