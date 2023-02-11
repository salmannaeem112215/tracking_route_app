import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({super.key});

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  late RiveAnimationController _buttonController;

  final playIcon = SimpleAnimation("Demo");
  final stopIcon = SimpleAnimation("Demo 2");

  bool isActive = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _buttonController = playIcon;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
          if (isActive) {
            _buttonController = stopIcon;
            // When Tracking Stop Function
          } else {
            _buttonController = playIcon;
            // When Tracking Start Function
          }
        });
      },
      child: SizedBox(
        height: 50,
        width: 176,
        child: RiveAnimation.asset(
          'assets/rive/play_pause_button.riv',
          controllers: [
            _buttonController,
          ],
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
