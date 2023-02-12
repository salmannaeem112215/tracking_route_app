// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class DragScrollSheet extends StatelessWidget {
  const DragScrollSheet({
    super.key,
    required this.child,
    required this.bottomSheetChild,
    required this.bottomPadding,
  });
  final Widget child;
  final Widget bottomSheetChild;
  final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double avaliableHeight = mediaQuery.size.height -
        kToolbarHeight -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    final dragableScrolSheetHolderSize = avaliableHeight * 0.05;

    return SingleChildScrollView(
      child: SizedBox(
        height: avaliableHeight - dragableScrolSheetHolderSize - bottomPadding,
        child: Stack(
          children: [
            child,
            DraggableScrollableSheet(
              snap: true,
              initialChildSize: 0.05,
              minChildSize: 0.05,
              maxChildSize: 0.75,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: SizedBox(
                    height: avaliableHeight * 0.75 - bottomPadding,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: Divider(
                              thickness: 3,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          bottomSheetChild,
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
}
