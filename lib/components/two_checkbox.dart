import 'package:flutter/material.dart';

class TwoCheckBox extends StatefulWidget {
  const TwoCheckBox({
    super.key,
    required this.updateValue,
    required this.firstValue,
    required this.secondValue,
  });
  final Function(bool) updateValue;
  final String firstValue;
  final String secondValue;
  @override
  State<TwoCheckBox> createState() => _TwoCheckBoxState();
}

class _TwoCheckBoxState extends State<TwoCheckBox> {
  bool isFirst = true;
  void _checkBoxClick(bool val) {
    setState(() {
      isFirst = val;
      // this update function will update value of parent class
      widget.updateValue(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.firstValue),
        Checkbox(
          value: isFirst,
          onChanged: (val) => _checkBoxClick(val!),
        ),
        const Spacer(),
        Text(widget.secondValue),
        Checkbox(
          value: !isFirst,
          onChanged: (val) => _checkBoxClick(!val!),
        ),
      ],
    );
  }
}
