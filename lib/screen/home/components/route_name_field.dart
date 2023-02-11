import 'package:flutter/material.dart';

class RouteNameField extends StatelessWidget {
  const RouteNameField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validateRouteName,
      decoration: InputDecoration(
        label: const Text('Route Name'),
        hintText: "5",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  String? _validateRouteName(val) {
    if (val!.isEmpty) {
      return "Enter Route Name";
    } else {
      return null;
    }
  }
}
