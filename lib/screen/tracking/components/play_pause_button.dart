import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../components/prompt.dart';
import '../../../data/tracking.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    super.key,
    required this.trackIndex,
  });
  final int trackIndex;
  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  // Play Pause Button Variables
  late RiveAnimationController _buttonController;
  final playIcon = SimpleAnimation("Demo");
  final stopIcon = SimpleAnimation("Demo 2");
  bool isActive = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _setButtonState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: playPauseRive(),
    );
  }

  // Play Pause Rive Icon  of Tracking
  SizedBox playPauseRive() {
    return SizedBox(
      height: 35,
      width: 176,
      child: RiveAnimation.asset(
        'assets/rive/play_pause_button.riv',
        controllers: [
          _buttonController,
        ],
        fit: BoxFit.contain,
      ),
    );
  }

  // Function Included in InitState
  // To Set State Of Button Depending Upon the Tracking
  void _setButtonState() {
    if (Tracking.tracking.isTracking) {
      // Tracking is Active
      if (widget.trackIndex == Tracking.tracking.trackIndex) {
        // Tracking Active & Same Page
        btnInStartState();
      } else {
        // Tracking Active & Different Page
        btnInStopState();
      }
    } else {
      // Tracking is Not Active
      btnInStopState();
    }
  }

  // Function Call When Button is Pressed
  void onPress() {
    isActive = !isActive;
    if (isActive) {
      onStart(context);
    } else {
      onEnd();
    }
  }

  void onStart(BuildContext ctx) async {
    // Ask Duration
    Duration? duration = await Prompt.promptDuration(ctx);

    if (duration != null) {
      // user Give the Duration
      setState(() {
        btnInStartState();
        Tracking.startTracking(widget.trackIndex, duration);
      });
    } else {
      // Invalid Duration or Close
    }
  }

  void onEnd() {
    // User Stop Tracking
    setState(() {
      btnInStopState();
      Tracking.stopTracking();
    });
  }

  void btnInStopState() {
    // Icon Update
    _buttonController = playIcon;
    isActive = false;
  }

  void btnInStartState() {
    // Icon Update
    _buttonController = stopIcon;
    isActive = true;
  }
}
