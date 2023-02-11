import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rive/rive.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late RiveAnimationController _buttonController;

  @override
  void initState() {
    _buttonController = SimpleAnimation("Demo");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20))),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: const Text('Add Stop'),
            ),
          )),
          GestureDetector(
            onTap: () {
              print('button press');
              setState(() {
                _buttonController = SimpleAnimation("Demo 2");
              });
            },
            child: SizedBox(
              height: 70,
              width: 250,
              child: RiveAnimation.asset(
                'assets/rive/play_pause_button.riv',
                controllers: [
                  _buttonController,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
