import 'package:flutter/material.dart';
import 'package:tracking_route_app/components/save_button.dart';

class AddStop extends StatelessWidget {
  AddStop({
    super.key,
    required this.onSave,
  });
  final Function(String) onSave;
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
          ),
        ],
      ),
      actions: [
        SaveButton(onPress: () => _onSave(context)),
        const SizedBox(width: 5),
        CloseButton(onPressed: () => _onCancel(context)),
      ],
    );
  }

  _clear() {
    _controller.text = "";
  }

  _onCancel(BuildContext context) {
    _clear();
    Navigator.pop(context);
  }

  _onSave(BuildContext context) {
    final stopName = _controller.text;
    // Code to perform on Save
    onSave(stopName);
    _clear();
    Navigator.pop(context);
  }
}
