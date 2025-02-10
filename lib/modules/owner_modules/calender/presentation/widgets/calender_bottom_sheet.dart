import 'package:flutter/material.dart';
import 'package:parotia/modules/owner_modules/calender/presentation/widgets/calender_bottom_sheet_choice.dart';
import 'package:parotia/modules/owner_modules/edit_price/edit_price.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/bottom_sheet_header.dart';

import '../../../edit_availability/edit_availability.dart';

class CalenderBottomSheet extends StatelessWidget {
  const CalenderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            BottomSheetHeader(title: 'Calender'),
            CalenderBottomSheetChoice(
                navigatorScreen: EditAvailability(), text: 'Edit Availability'),
            CalenderBottomSheetChoice(
                navigatorScreen: EditPrice(), text: 'Edit Price'),
          ],
        ),
      ),
    );
  }
}
