import 'package:flutter/material.dart';
import 'package:tracking_route_app/constants.dart';
import 'package:tracking_route_app/screen/tracking/components/bus_stops.dart';
import 'package:tracking_route_app/screen/tracking/components/tracking_points.dart';

class StopTrack extends StatelessWidget {
  const StopTrack({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: kDarkPrimaryTextGrey,
            unselectedLabelColor: Colors.grey,
            indicatorColor: kDarkPrimaryTextGrey,
            tabs: [
              Tab(text: "Tracking Points"),
              Tab(text: "Bus Stops"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TrackingPoints(index: index),
                BusStops(index: index),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
