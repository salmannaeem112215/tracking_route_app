import 'package:flutter/material.dart';
import 'package:tracking_route_app/screen/home/components/add_track_form.dart';

import './components/body.dart';

import 'package:tracking_route_app/data/tracks.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const AddTrackForm());
          }),
    );
  }
}
