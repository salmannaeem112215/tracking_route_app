import 'package:flutter/material.dart';

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
