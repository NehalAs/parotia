import 'package:flutter/material.dart';
import 'package:parotia/modules/owner_modules/calender/presentation/widgets/calender_bottom_sheet_choice.dart';
import 'package:parotia/modules/owner_modules/edit_availability/presentation/views/edit_availability_view.dart';
import 'package:parotia/modules/owner_modules/edit_price/presentation/views/edit_price_view.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/bottom_sheet_header.dart';


class CalenderBottomSheet extends StatelessWidget {
  const CalenderBottomSheet({super.key, required this.selectedDays, required this.rentalId});
  final List<DateTime> selectedDays;
  final String rentalId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            const BottomSheetHeader(title: 'Calender'),
            CalenderBottomSheetChoice(
                navigatorScreen: EditAvailabilityView(days: selectedDays,rentalId: rentalId,), text: 'Edit Availability'),
            CalenderBottomSheetChoice(
                navigatorScreen: EditPriceView(days:selectedDays, rentalId: rentalId,), text: 'Edit Price'),
          ],
        ),
      ),
    );
  }
}
