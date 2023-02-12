import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/tracks.dart';
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
            index: index,
          ),
        ),
      );
    });
  }
}
