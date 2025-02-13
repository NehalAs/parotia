import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/back_item.dart';
import 'package:parotia/core/shared_components/custom_button.dart';
import 'package:parotia/modules/owner_modules/calender/presentation/widgets/calender_bottom_sheet.dart';
import 'package:parotia/modules/owner_modules/calender/presentation/widgets/calender_header_style.dart';
import 'package:parotia/modules/owner_modules/my_rentals/models/rental_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key, required this.rentalModel});
  final RentalModel rentalModel;
  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  DateTime _focusedDay = DateTime.now();
  List<DateTime> _selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackItem(
                isCloseIcon: true,
                radius: 15,
              ),
              const SizedBox(height: 20),
              Text('Calendar', style: Styles.fontSize28Bold),
              Text('You can change it anytime.',
                  style: Styles.fontSize16RegularGrey),
              const SizedBox(height: 20),
              TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return _selectedDays
                      .any((selected) => isSameDay(selected, day));
                },
                onDaySelected: (selectedDay, focusedDay) {
                  // widget.rentalModel.calendar!.notAvailableDays!
                  //     .any((d) => isSameDay(DateTime.parse(d), selectedDay)) ||
                  if (isSameDay(selectedDay,DateTime.now()) ) {
                    return; // Prevent selection of unavailable days
                  }

                  setState(() {
                    if (_selectedDays.any((d) => isSameDay(d, selectedDay))) {
                      _selectedDays
                          .removeWhere((d) => isSameDay(d, selectedDay));
                    } else {
                      _selectedDays.add(selectedDay);
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
                    color:AppColors.orange0B,
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
              ),
              const SizedBox(height: 20),
              const Divider(color: AppColors.greyEE),
              const Spacer(),
              if (_selectedDays.isNotEmpty)
                CustomButton(
                  text: 'Edit Days',
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => CalenderBottomSheet(
                      selectedDays: _selectedDays, rentalId: widget.rentalModel.id!,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
