// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.name});
  final String name;
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
              child: const Placeholder(),
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
