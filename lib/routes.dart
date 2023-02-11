import 'package:flutter/material.dart';

import './screen/home/home_screen.dart';
import './screen/tracking/tracking_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.routeName: (contex) => const HomeScreen(),
  TrackingScreen.routeName: (context) => const TrackingScreen(),
};
