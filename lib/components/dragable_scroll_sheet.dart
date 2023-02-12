// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class DragScrollSheet extends StatelessWidget {
  const DragScrollSheet({
    super.key,
    required this.child,
    required this.bottomChild,
    this.bottomNavbarHeight = kBottomNavigationBarHeight,
    this.bottomColor = Colors.white,
  });
  final Widget child;
  final Widget bottomChild;
  final double bottomNavbarHeight;
  final Color bottomColor;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    const appBarHeight = kToolbarHeight;
    const appBarTopHeight = 32;
    const totalAppBarHeight = appBarHeight + appBarTopHeight;

    const handelPercent = 0.05;
    const sheetPercent = 0.70;
    const totalPercent = handelPercent + sheetPercent;

    final totalScreenHeight =
        mediaQuery.size.height - totalAppBarHeight - bottomNavbarHeight;

    final handelSize = totalScreenHeight * handelPercent;
    final sheetSize = totalScreenHeight * sheetPercent;
    final totalSheetSize = handelSize + sheetSize;

    return SingleChildScrollView(
      child: SizedBox(
        height: totalScreenHeight,
        child: Stack(
          children: [
            // main  Body
            SizedBox(
              height: totalScreenHeight,
              child: child,
            ),

            // Dragable Sheet
            DraggableScrollableSheet(
              // will open and close with little push
              snap: true,
              initialChildSize: handelPercent,
              minChildSize: handelPercent,
              maxChildSize: totalPercent,
              builder: (context, scrollController) {
                return SizedBox(
                  height: totalSheetSize + 50,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bottomColor,
                        borderRadius: topCurveRadius(handelSize),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          getHandel(handelSize),

                          // Sheet Body
                          SizedBox(
                            height: sheetSize,
                            child: bottomChild,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  BorderRadius topCurveRadius(double handelSize) {
    return BorderRadius.vertical(
      top: Radius.circular(handelSize),
    );
  }

  SizedBox getHandel(double handelSize) {
    return SizedBox(
      width: 100,
      height: handelSize,
      child: const Divider(
        thickness: 3,
        color: Colors.white,
      ),
    );
  }
}
