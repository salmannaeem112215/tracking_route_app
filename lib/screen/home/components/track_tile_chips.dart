import 'package:flutter/material.dart';

import '../../../components/bold_normal_text.dart';

class TrackTileChips extends StatelessWidget {
  const TrackTileChips(
      {super.key,
      required this.stops,
      required this.mins,
      required this.isMorning});
  final int stops;
  final double mins;
  final bool isMorning;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Total Stop Chip
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Chip(
                label: BoldNormalText(
                  boldText: stops.toString(),
                  normalText: ' stops',
                  fontSize: 14,
                ),
              ),
            ),

            // Total Mins CHip
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Chip(
                label: BoldNormalText(
                  boldText: mins.toStringAsPrecision(1),
                  normalText: ' min',
                  fontSize: 14,
                ),
              ),
            ),

            // Morning Evening Chip
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Chip(
                label: Text(isMorning ? "M" : "E"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
