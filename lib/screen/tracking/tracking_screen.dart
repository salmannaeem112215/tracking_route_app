import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_route_app/models/location.dart';
import '../../data/tracks.dart';
import '../../data/track.dart';

import './components/body.dart';
import './components/bottom_navbar.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});
  static String routeName = '/tracking';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    final track = Provider.of<Tracks>(listen: false, context).getTrackAt(index);

    // .value to not dispose track
    return ChangeNotifierProvider.value(
      value: track,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              '${track.name} - ${track.isMorning ? "Morning" : "Evening"}'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavbar(
          addStop: (String name) {
            print(name);
            track.addStop(
              title: name,
              location: Location(lat: 32, lon: 64), // default Location
              timeOfArrival: DateTime.now(),
              routeNo: track.name,
              isMorning: track.isMorning,
            );
          },
        ),
        body: Body(
          index: index,
        ),
      ),
    );
  }
}
