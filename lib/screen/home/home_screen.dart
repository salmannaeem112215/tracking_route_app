import 'package:flutter/material.dart';

import 'components/add_track.dart';
import './components/body.dart';

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
                context: context, builder: (context) => const AddTrack());
          }),
    );
  }
}
