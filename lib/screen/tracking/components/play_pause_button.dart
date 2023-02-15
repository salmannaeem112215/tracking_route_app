import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../data/tracking.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    super.key,
  });
  final int track_index = 0;
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

    print('Open Track');
    // In Tracking Process
    bool isTrackingSame = false;
    if (Tracking.tracking.isTracking) {
      // Check if Same Route Track Index
      if (widget.track_index == Tracking.tracking.track_index) {
        isTrackingSame = true;
      }
    }
    print('is Tracking Same  = $isTrackingSame');
    print(
        'Tracking Index  = ${Tracking.tracking.track_index}   PlayBut inde = ${widget.track_index}');
    if (isTrackingSame) {
      _buttonController = stopIcon;
    } else {
      _buttonController = playIcon;
    }
  }

  // Function that will be call after every 5 secs.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isActive = !isActive;
        if (isActive) {
          _buttonController = stopIcon;
          // When Tracking Start Function
          onStart(context);
        } else {
          _buttonController = playIcon;
          // When Tracking Stop Function
          onEnd();
        }
      },
      child: SizedBox(
        height: 35,
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

  void onStart(BuildContext ctx) async {
    // User Start Tracking
    Duration? user_selected_duration = await Tracking.promptDuration(ctx);

    if (user_selected_duration != null) {
      // user Give the Duration
      setState(() {
        Tracking.startTracking(widget.track_index, user_selected_duration);
      });
    } else {
      // Canceling Because User didn't enter Duration
    }
  }

  void onEnd() {
    // User Stop Tracking
    setState(() {
      Tracking.stopTracking();
    });
  }
}
