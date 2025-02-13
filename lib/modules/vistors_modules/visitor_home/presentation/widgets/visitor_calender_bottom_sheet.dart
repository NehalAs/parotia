import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_util.dart';
import 'package:parotia/modules/vistors_modules/reservation_successfully/presentation/views/reservation_successfully_view.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/visitor_selected_days_range_row.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../core/shared_components/back_item.dart';
import '../../../../../core/shared_components/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../owner_modules/calender/presentation/widgets/calender_header_style.dart';
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
  DateTime _focusedDay = DateTime.now();
  List<DateTime> _selectedDays = [];
  num totalPrice = 0;
  @override
  Widget build(BuildContext context) {
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
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return _selectedDays
                    .any((selected) => isSameDay(selected, day));
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (widget.rentalModel.calendar!.notAvailableDays!.any(
                        (d) => isSameDay(DateTime.parse(d), selectedDay)) ||
                    isSameDay(selectedDay, DateTime.now())) {
                  return; // Prevent selection of unavailable days
                }

                setState(() {
                  if (_selectedDays.any((d) => isSameDay(d, selectedDay))) {
                    _selectedDays.removeWhere((d) => isSameDay(d, selectedDay));
                    if (widget.rentalModel.calendar!.daysPrices!
                        .containsKey(selectedDay.toString().split('Z')[0])) {
                      totalPrice = totalPrice -
                          widget.rentalModel.calendar?.daysPrices?[
                          selectedDay.toString().split('Z')[0]];
                    }
                  } else {
                    _selectedDays.add(selectedDay);
                    if (widget.rentalModel.calendar!.daysPrices!
                        .containsKey(selectedDay.toString().split('Z')[0])) {
                      totalPrice = totalPrice +
                          widget.rentalModel.calendar?.daysPrices?[
                              selectedDay.toString().split('Z')[0]];
                    }
                  }
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                todayDecoration: const BoxDecoration(
                  color: AppColors.orange0B,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.orange0B,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                outsideDaysVisible: false,
              ),
              headerStyle: calenderHeaderStyle(context),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  bool isUnavailable = widget
                      .rentalModel.calendar!.notAvailableDays!
                      .any((d) => isSameDay(DateTime.parse(d), date));
                  int? price = widget.rentalModel.calendar!
                      .daysPrices?[date.toString().split('Z')[0]];

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(
                            color: isUnavailable ? Colors.grey : Colors.black,
                            decoration: isUnavailable
                                ? TextDecoration.lineThrough
                                : null,
                            decorationColor: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      if (price != null)
                        Positioned(
                          bottom: 2,
                          child: Text(
                            "\$${price}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            const Divider(),
            const Spacer(),
            Text(
              'Reservation start & end',
              style: Styles.fontSize14RegularGrey,
            ),
            VisitorSelectedDaysRangeRow(days: _selectedDays),
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
                  _selectedDays.isEmpty ? const Color(0xffFECAA2) : null,
              text: 'Save',
              onPressed: _selectedDays.isNotEmpty
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
