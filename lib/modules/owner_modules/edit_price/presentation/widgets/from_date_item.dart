import 'package:flutter/material.dart';
import 'package:parotia/core/utils/styles.dart';

class FromDateItem extends StatelessWidget {
  const FromDateItem({super.key, required this.title, required this.date});

  final String title;
  final String date;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Styles.fontSize16RegularGrey),
        Text(date, style: Styles.fontSize16RegularGrey.copyWith(color: Colors.black)),
      ],
    );
  }
}
