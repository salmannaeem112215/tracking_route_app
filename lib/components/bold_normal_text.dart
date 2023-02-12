import 'package:flutter/material.dart';

class BoldNormalText extends StatelessWidget {
  const BoldNormalText({
    super.key,
    required this.boldText,
    required this.normalText,
    this.fontSize = 16,
    this.color = Colors.black,
  });
  final String boldText;
  final String normalText;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: boldText,
          children: [
            TextSpan(
              text: normalText,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            )
          ],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: fontSize,
          )),
    );
  }
}
