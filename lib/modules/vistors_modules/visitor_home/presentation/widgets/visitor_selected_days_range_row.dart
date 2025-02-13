import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parotia/core/utils/styles.dart';

class VisitorSelectedDaysRangeRow extends StatelessWidget {
  const VisitorSelectedDaysRangeRow({super.key, required this.days});

  final List<DateTime> days;
  @override
  Widget build(BuildContext context) {
    days?.sort();
    return  Row(
      children: [
        Text(
        days.isEmpty?'':
        DateFormat('E, d MMM yyyy').format(days[0]).toString(),
          style: Styles.fontSize14RegularGrey
              .copyWith(color: Colors.black),
        ),
       const Spacer(),
        Text(
          days.isEmpty?'':
        DateFormat('E, d MMM yyyy').format(days.last).toString(),
          style: Styles.fontSize14RegularGrey
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
