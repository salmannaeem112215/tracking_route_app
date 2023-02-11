// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import './bus_stops.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double screenSize = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;
    double mapHeight = screenSize / 2;
    double boxHeight = screenSize / 2;

    return SingleChildScrollView(
      child: SizedBox(
        height: mapHeight + boxHeight + boxHeight,
        child: Column(
          children: [
            SizedBox(
              height: mapHeight,
              child: const Placeholder(),
            ),
            Container(
              height: boxHeight,
              child: BusStops(
                index: index,
              ),
            ),
            Container(
              height: boxHeight,
              child: const Placeholder(),
            )
          ],
        ),
      ),
    );
  }
}
