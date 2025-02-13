import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/modules/owner_modules/my_rentals/models/rental_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../modules/owner_modules/calender/presentation/widgets/calender_header_style.dart';

class CustomTableCalender extends StatelessWidget {
   CustomTableCalender({super.key, required this.selectedDays, required this.rentalModel, required this.onDaySelected});

   final RentalModel rentalModel;
   final List<DateTime> selectedDays;
   final void Function(DateTime,DateTime) onDaySelected;
  final DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  TableCalendar(
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) {
        return selectedDays
            .any((selected) => isSameDay(selected, day));
      },
      onDaySelected: onDaySelected,
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
          bool isUnavailable =rentalModel.calendar!.notAvailableDays!
              .any((d) => isSameDay(DateTime.parse(d), date));
          int? price =rentalModel.calendar!
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
                    decorationColor: Colors.grey,
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
    );
  }
}
