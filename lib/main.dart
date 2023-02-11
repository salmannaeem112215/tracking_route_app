import 'package:flutter/material.dart';
import 'package:tracking_route_app/data/tracks.dart';
import 'package:tracking_route_app/routes.dart';

import './screen/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'models/stops.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tracks(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.routeName,
        routes: routes,
      ),
    );
  }
}
