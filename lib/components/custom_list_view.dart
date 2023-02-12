import 'package:flutter/material.dart';
import 'package:tracking_route_app/constants.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.title,
    required this.onCopy,
    required this.listView,
  });
  final String title;
  final VoidCallback onCopy;
  final ListView listView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: Colors.grey),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: kDarkSecondaryTextGrey,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: onCopy,
                child: Row(
                  children: const [
                    Icon(
                      Icons.content_paste_rounded,
                      color: kDarkChipColor,
                    ),
                    SizedBox(width: 3),
                    Text('Copy', style: TextStyle(color: kDarkPrimaryTextGrey)),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
                color: kDarkPrimaryTextGrey),
            child: listView,
          ),
        ),
      ],
    );
  }
}
