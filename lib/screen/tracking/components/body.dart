// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../../components/dragable_scroll_sheet.dart';
import './bus_stops.dart';
import 'stop_track.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double avaliableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        kToolbarHeight;
    final dragableScrolSheetHolderSize = avaliableHeight * 0.05;

    return SingleChildScrollView(
        child: DragScrollSheet(
      bottomPadding: 92,
      child: Placeholder(),
      bottomSheetChild: Placeholder(),
    ));
  }
}
