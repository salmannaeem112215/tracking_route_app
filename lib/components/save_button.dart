import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.onPress});
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(),
      child: const Text(' Save '),
    );
  }
}
