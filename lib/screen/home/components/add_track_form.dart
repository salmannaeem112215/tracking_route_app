import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_route_app/components/save_button.dart';
import 'package:tracking_route_app/components/two_checkbox.dart';
import 'package:tracking_route_app/data/tracks.dart';
import 'package:tracking_route_app/screen/home/components/route_name_field.dart';

class AddTrackForm extends StatefulWidget {
  const AddTrackForm({super.key});

  @override
  State<AddTrackForm> createState() => _AddTrackFormState();
}

class _AddTrackFormState extends State<AddTrackForm> {
  bool _isMorning = true;
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RouteNameField(controller: _nameController),
              const SizedBox(height: 10),
              TwoCheckBox(
                updateValue: _checkBoxClick,
                firstValue: 'Morning ',
                secondValue: 'Evening',
              ),
            ],
          ),
          actions: [
            SaveButton(onPress: () => _save(context)),
            const SizedBox(width: 5),
            CloseButton(onPressed: () => _cancel(context)),
          ]),
    );
  }

  void _checkBoxClick(bool val) {
    _isMorning = val;
  }

  void _clear() {
    _nameController.text = "";
  }

  void _cancel(BuildContext context) {
    Navigator.pop(context);
    _clear();
  }

  void _save(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Provider.of<Tracks>(listen: false, context).addTrack(
        trackName: _nameController.text,
        isMorning: _isMorning,
      );
      Navigator.pop(context);
      _clear();
    }
  }
}
