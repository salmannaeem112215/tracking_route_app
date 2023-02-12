import 'package:flutter/material.dart';

class TextWithWidget extends StatelessWidget {
  const TextWithWidget({super.key, required this.child, required this.text});
  final Widget child;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        Text(text),
      ],
    );
  }
}
