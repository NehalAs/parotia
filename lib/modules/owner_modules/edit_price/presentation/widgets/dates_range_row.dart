import 'package:flutter/material.dart';
import 'package:parotia/modules/owner_modules/edit_price/presentation/widgets/from_date_item.dart';

class DatesRangeRow extends StatelessWidget {
  const DatesRangeRow({super.key, required this.isOneDayOnly});
  final bool isOneDayOnly;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         FromDateItem(title: isOneDayOnly?'Date':'From Date',date: 'Sun, 12 Mar 2022',),
        if(!isOneDayOnly)...[
          const SizedBox(width: 60,),
          const FromDateItem(title:'To Date' ,date: 'Sun, 12 Mar 2022',),
        ]
      ],
    );
  }
}
