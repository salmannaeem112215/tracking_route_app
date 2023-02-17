import 'package:flutter/material.dart';
import 'package:tracking_route_app/constants.dart';

class TrackingPointTile extends StatelessWidget {
  const TrackingPointTile({
    super.key,
    required this.no,
    required this.title,
    required this.onDelete,
  });

  final int no;
  final String title;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3, left: 5, right: 5, top: 2),
      decoration: BoxDecoration(
        color: kDarkTileColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: Text('#$no'),
        title: Text(title),
        trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: kDarkDustbinColor,
            )),
      ),
    );
  }
}
