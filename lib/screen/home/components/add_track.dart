import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/save_button.dart';
import '../../../data/tracks.dart';
import '../../../components/cancel_button.dart';
import './add_track_form.dart';

class AddTrack extends StatefulWidget {
  const AddTrack({super.key});

  @override
  State<AddTrack> createState() => _AddTrackState();
}

class _AddTrackState extends State<AddTrack> {
  bool _isMorning = true;
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: AddTrackForm(
        formKey: _formKey,
        nameController: _nameController,
        isMorning: _setIsMorning,
      ),
      actions: [
        SaveButton(onPress: () => _save(context)),
        CancelButton(onPress: () => _cancel(context)),
      ],
    );
  }

  void _setIsMorning(bool val) {
    _isMorning = val;
  }

  void _clear() {
    _nameController.text = "";
  }

  // Close ShowDailog
  void _cancel(BuildContext context) {
    Navigator.pop(context);
    _clear();
  }

  // Call Validation then Add To Track
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
