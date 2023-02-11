import 'package:flutter/material.dart';

import './add_stop.dart';
import './play_pause_button.dart';
import '../../../components/text_with_widget.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key, required this.addStop});
  final Function(String) addStop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(96, 125, 139, 0.1),
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TextWithWidget(widget: PlayPauseButton(), text: 'Tracking'),
          // const Spacer(),
          TextWithWidget(
            text: 'Add Stop',
            widget: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AddStop(onSave: addStop),
              ),
              child: Icon(
                Icons.add_location_rounded,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
