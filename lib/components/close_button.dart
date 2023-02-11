import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key, required this.onPress});
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPress(),
      child: const Text('Close'),
    );
  }
}
