import 'package:flutter/material.dart';
import 'package:tracking_route_app/components/two_checkbox.dart';

class AddTrackForm extends StatelessWidget {
  const AddTrackForm(
      {super.key,
      required this.isMorning,
      required this.nameController,
      required this.formKey});
  final Function(bool) isMorning;
  final TextEditingController nameController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Route Name asking
          TextFormField(
            controller: nameController,
            validator: _validateRouteName,
            decoration: InputDecoration(
              label: const Text('Route Name'),
              hintText: "5",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Is mornign or Eveneing Checkboxed
          TwoCheckBox(
            updateValue: isMorning,
            firstValue: 'Morning ',
            secondValue: 'Evening',
          ),
        ],
      ),
    );
  }

  // Validator for Route Name
  String? _validateRouteName(val) {
    if (val!.isEmpty) {
      return "Enter Route Name";
    } else {
      return null;
    }
  }
}
