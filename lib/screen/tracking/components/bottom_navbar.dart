import 'package:flutter/material.dart';
import 'package:tracking_route_app/constants.dart';

import './add_stop.dart';
import './play_pause_button.dart';
import '../../../components/text_with_widget.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key, required this.addStop});
  final Function(String) addStop;
  static double bottomNavbarHeight = 70;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        decoration: const BoxDecoration(
            color: kDarkBottomNavbarColor,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20), bottom: Radius.circular(20))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TextWithWidget(
              text: 'Tracking',
              child: PlayPauseButton(),
            ),
            TextWithWidget(
              text: 'Add Stop',
              child: addStopButton(context),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }

  InkWell addStopButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AddStop(onSave: addStop),
      ),
      child: Icon(
        Icons.add_location_rounded,
        size: 35,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
