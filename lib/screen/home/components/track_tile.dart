import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TrackTile extends StatelessWidget {
  const TrackTile({
    super.key,
    required this.trackName,
    required this.totalStops,
    required this.date,
    required this.time,
    required this.onPress,
    required this.onDelete,
    required this.onUpload,
  });
  final String trackName;
  final int totalStops;
  final String date;
  final String time;
  final Function onPress;
  final Function onDelete;
  final Function onUpload;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Slidable(
        endActionPane: buttons(),
        child: trackTile(),
      ),
    );
  }

  Container trackTile() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(10)),
      ),
      child: ListTile(
        title: Text(trackName),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () => onPress(),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text('$totalStops Stops'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(date),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(time),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ActionPane buttons() {
    return ActionPane(motion: const StretchMotion(), children: [
      // Upload Button
      SlidableAction(
        onPressed: (ctx) => onUpload(),
        icon: Icons.cloud_upload_rounded,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade300,
      ),
      // Delete Button
      SlidableAction(
        onPressed: (ctx) => onDelete(),
        icon: Icons.delete,
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(10)),
        backgroundColor: Colors.red.shade500,
      )
    ]);
  }
}
