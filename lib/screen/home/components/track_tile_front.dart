import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/bold_normal_text.dart';
import '../../../components/text_with_widget.dart';
import '../../../constants.dart';
import '../../../data/track.dart';
import '../../tracking/tracking_screen.dart';
import './track_tile_chips.dart';

class TrackTileFront extends StatelessWidget {
  const TrackTileFront({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<Track>(builder: (context, track, child) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: kTrackingTileBoxDecoration,
        child: ListTile(
          title: BoldNormalText(boldText: 'Route : ', normalText: track.name),
          subtitle: TrackTileChips(
            stops: track.busStops.stops.length,
            mins: track.busPath.path.length / 6,
            isMorning: track.isMorning,
          ),
          trailing: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                TrackingScreen.routeName,
                arguments: index,
              );
            },
            child: const TextWithWidget(
              text: 'tracking',
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      );
    });
  }
}
