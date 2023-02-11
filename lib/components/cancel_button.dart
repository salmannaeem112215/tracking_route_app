import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, required this.onPress});
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPress(),
      child: const Text('Close'),
    );
  }
}
