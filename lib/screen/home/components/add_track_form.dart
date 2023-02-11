import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_route_app/data/tracks.dart';

class AddTrackForm extends StatefulWidget {
  const AddTrackForm({super.key});

  @override
  State<AddTrackForm> createState() => _AddTrackFormState();
}

class _AddTrackFormState extends State<AddTrackForm> {
  bool _isMorning = true;
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _checkBoxClick(bool val) {
    setState(() {
      _isMorning = val;
    });
  }

  void _clear() {
    _nameController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter Route Name";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                label: const Text('Route Name'),
                hintText: "5",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Morning '),
                Checkbox(
                    value: _isMorning,
                    onChanged: (val) => _checkBoxClick(val!)),
                const Spacer(),
                const Text('Evening '),
                Checkbox(
                    value: !_isMorning,
                    onChanged: (val) => _checkBoxClick(!val!)),
              ],
            ),
          ],
        ),
        actions: [
          // Save
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Provider.of<Tracks>(listen: false, context).addTrack(
                    trackName: _nameController.text,
                    isMorning: _isMorning,
                  );
                  Navigator.pop(context);
                  _clear();
                }
              },
              child: const Text(' Save ')),
          // Close
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                _clear();
              },
              child: const Text('Close')),
        ],
      ),
    );
  }
}
