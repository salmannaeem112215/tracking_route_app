import 'package:flutter/material.dart';
import 'package:tracking_route_app/screen/tracking/components/play_pause_button.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

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
                builder: (context) => Container(),
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

class TextWithWidget extends StatelessWidget {
  const TextWithWidget({super.key, required this.widget, required this.text});
  final Widget widget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget,
        Text(text),
      ],
    );
  }
}
