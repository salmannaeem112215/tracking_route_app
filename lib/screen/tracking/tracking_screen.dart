import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_route_app/constants.dart';

import './components/body.dart';
import './components/bottom_navbar.dart';
import '../../models/location.dart';
import '../../data/tracks.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});
  static String routeName = '/tracking';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    // int index = 0; // for testing
    final track = Provider.of<Tracks>(listen: false, context).getTrackAt(index);

    // .value to not dispose track
    return ChangeNotifierProvider.value(
      value: track,
      child: ChangeNotifierProvider.value(
        value: track.busPath,
        child: Scaffold(
          backgroundColor: kDarkBackground,
          appBar: AppBar(
            title: Text(
                '${track.name} - ${track.isMorning ? "Morning" : "Evening"}'),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavbar(
            trackIndex: index,
            addStop: (String name) {
              track.addStop(
                title: name,
                location: const Location(lat: 32, lon: 64), // default Location
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
      ),
    );
  }
}
