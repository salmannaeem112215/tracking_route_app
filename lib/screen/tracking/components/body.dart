// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tracking_route_app/screen/tracking/components/bottom_navbar.dart';

import '../../../components/dragable_scroll_sheet.dart';
import './bus_stops.dart';
import 'stop_track.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: DragScrollSheet(
      child: Container(
        child: Center(child: Text('Map')),
      ),
      bottomChild: StopTrack(
        index: index,
      ),
      bottomColor: Color(0xff333333),
    ));
  }
}
