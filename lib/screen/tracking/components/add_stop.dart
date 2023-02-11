import 'package:flutter/material.dart';
import 'package:tracking_route_app/components/save_button.dart';

class AddStop extends StatelessWidget {
  const AddStop({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(),
      actions: [
        SaveButton(onPress: () {}),
        const SizedBox(width: 5),
        CloseButton(onPressed: () {}),
      ],
    );
  }
}
