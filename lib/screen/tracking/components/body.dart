// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:tracking_route_app/constants.dart';
import 'package:tracking_route_app/screen/map/map_map_box.dart';
import 'package:tracking_route_app/screen/tracking/components/bottom_navbar.dart';

import '../../../components/dragable_scroll_sheet.dart';
import 'stop_track.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DragScrollSheet(
        bottomColor: kDarkBackground,
        bottomNavbarHeight: BottomNavbar.bottomNavbarHeight,
        // Map
        child: Container(
            color: Colors.white, child: MapMapbox(onMapCreated: () {})),
        // Dragable Sheet Content
        bottomChild: StopTrack(
          index: index,
        ),
      ),
    );
  }
}
