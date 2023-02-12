import 'package:flutter/material.dart';
import 'package:tracking_route_app/screen/tracking/components/bus_stops.dart';

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
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Bus Stops"),
              Tab(text: "Tracking Points"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(
                  child: BusStops(index: 1),
                ),
                Container(
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
