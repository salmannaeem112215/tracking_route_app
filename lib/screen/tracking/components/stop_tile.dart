import 'package:flutter/material.dart';

class StopTile extends StatelessWidget {
  const StopTile({
    super.key,
    required this.no,
    required this.title,
    required this.time,
    required this.isAm,
    required this.onDelete,
  });

  final int no;
  final String title;
  final String time;
  final bool isAm;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: Text('#$no'),
        title: Text(title),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 3),
          child: Row(
            children: [
              Chip(label: Text(time)),
              const SizedBox(width: 5),
              Chip(label: Text(isAm ? 'AM' : 'PM')),
            ],
          ),
        ),
        trailing: IconButton(
            onPressed: () => onDelete(),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
