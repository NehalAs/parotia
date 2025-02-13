import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/custom_table_calender.dart';
import 'package:parotia/core/utils/app_util.dart';
import 'package:parotia/modules/vistors_modules/reservation_successfully/presentation/views/reservation_successfully_view.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/visitor_selected_days_range_row.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../core/shared_components/back_item.dart';
import '../../../../../core/shared_components/custom_button.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../owner_modules/my_rentals/models/rental_model.dart';

class VisitorCalenderBottomSheet extends StatefulWidget {
  const VisitorCalenderBottomSheet({super.key, required this.rentalModel});

  final RentalModel rentalModel;
  @override
  State<VisitorCalenderBottomSheet> createState() =>
      _VisitorCalenderBottomSheetState();
}

class _VisitorCalenderBottomSheetState
    extends State<VisitorCalenderBottomSheet> {
  List<DateTime> selectedDays = [];
  num totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? daysPrices = widget.rentalModel.calendar?.daysPrices;
    return SizedBox(
      height: 650,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackItem(
              isCloseIcon: true,
              radius: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.rentalModel.name ?? '',
              style: Styles.fontSize20Regular
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            CustomTableCalender(
              selectedDays: selectedDays,
              rentalModel: widget.rentalModel,
              onDaySelected: (selectedDay, focusedDay) {
                String stringSelectedDay = selectedDay.toString().split('Z')[0];

                bool isSelectedDayNotAvailable = widget
                    .rentalModel.calendar!.notAvailableDays!
                    .any((d) => isSameDay(DateTime.parse(d), selectedDay));

                bool isSelectedDayInPriceList =
                    daysPrices!.containsKey(stringSelectedDay);

                // don't select if not available or is today else will add it to selected list
                if (isSelectedDayNotAvailable ||
                    isSameDay(selectedDay, DateTime.now())) {
                  return; // Prevent selection of unavailable days
                }
                setState(() {
                  // check if already selected unselect it
                  bool thisDayIsAlreadySelected =
                      selectedDays.any((d) => isSameDay(d, selectedDay));

                  if (thisDayIsAlreadySelected) {
                    selectedDays.removeWhere((d) => isSameDay(d, selectedDay));
                    // if day in prices list will subtract it's price from total price
                    if (isSelectedDayInPriceList) {
                      totalPrice = totalPrice - daysPrices[stringSelectedDay];
                    }
                  } else {
                    selectedDays.add(selectedDay);
                    if (isSelectedDayInPriceList) {
                      totalPrice = totalPrice + daysPrices[stringSelectedDay];
                    }
                  }
                });
              },
            ),
            const Divider(),
            const Spacer(),
            Text(
              'Reservation start & end',
              style: Styles.fontSize14RegularGrey,
            ),
            VisitorSelectedDaysRangeRow(days: selectedDays),
            const SizedBox(
              height: 10,
            ),
            Text(
              'EGP $totalPrice',
              style: Styles.fontSize16Bold,
            ),
            const Spacer(),
            CustomButton(
              buttonColor:
                  selectedDays.isEmpty ? const Color(0xffFECAA2) : null,
              text: 'Save',
              onPressed: selectedDays.isNotEmpty
                  ? () {
                      AppUtil.mainNavigator(
                          context, const ReservationSuccessfullyView());
                    }
                  : () {},
            )
          ],
        ),
      ),
    );
  }
}
