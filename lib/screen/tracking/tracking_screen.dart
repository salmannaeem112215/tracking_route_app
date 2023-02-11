import 'package:flutter/material.dart';

import './components/body.dart';
import './components/bottom_navbar.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});
  static String routeName = '/tracking';

  final String name = '5';
  final bool isMorning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name - ${isMorning ? "Morning" : "Evening"}'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade300,
        onPressed: () =>
            showDialog(context: context, builder: (context) => Container()),
        child: const Icon(Icons.add_location_rounded),
      ),
      body: Body(name: name),
    );
  }
}
