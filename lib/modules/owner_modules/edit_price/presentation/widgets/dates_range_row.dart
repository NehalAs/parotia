import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parotia/modules/owner_modules/edit_price/presentation/widgets/from_date_item.dart';

class DatesRangeRow extends StatelessWidget {
  const DatesRangeRow({super.key, required this.isOneDayOnly, required this.days});
  final bool isOneDayOnly;
  final List<DateTime> days;

  @override
  Widget build(BuildContext context) {
    days.sort();
    return  Row(
      children: [
         FromDateItem(title: isOneDayOnly?'Date':'From Date',date: DateFormat('E, d MMM yyyy').format(days[0]).toString(),),
        if(!isOneDayOnly)...[
          const Spacer(),
          FromDateItem(title:'To Date' ,date: DateFormat('E, d MMM yyyy').format(days.last).toString(),),
        ]
      ],
    );
  }
}
