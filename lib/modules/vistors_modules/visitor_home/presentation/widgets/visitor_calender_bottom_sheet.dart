import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_util.dart';
import 'package:parotia/modules/vistors_modules/reservation_successfully/presentation/views/reservation_successfully_view.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/shared_components/back_item.dart';
import '../../../../../core/shared_components/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../owner_modules/calender/presentation/widgets/calender_bottom_sheet.dart';
import '../../../../owner_modules/calender/presentation/widgets/calender_header_style.dart';

class VisitorCalenderBottomSheet extends StatefulWidget {
  const VisitorCalenderBottomSheet({super.key});

  @override
  State<VisitorCalenderBottomSheet> createState() =>
      _VisitorCalenderBottomSheetState();
}

class _VisitorCalenderBottomSheetState
    extends State<VisitorCalenderBottomSheet> {
  DateTime _focusedDay = DateTime.now();
  List<DateTime> _selectedDays = [];

  final Map<DateTime, int> priceData = {
    DateTime(2025, 2, 12): 50,
    DateTime(2025, 2, 13): 55,
    DateTime(2025, 2, 14): 60,
    DateTime(2025, 2, 15): 70,
  };

  final List<DateTime> _unavailableDays = [
    DateTime(2025, 2, 4),
    DateTime(2025, 2, 18),
  ];
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
              'Sahary in al jahra, Kuwait',
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
                if (_unavailableDays.any((d) => isSameDay(d, selectedDay))) {
                  return; // Prevent selection of unavailable days
                }

                setState(() {
                  if (_selectedDays.any((d) => isSameDay(d, selectedDay))) {
                    _selectedDays.removeWhere((d) => isSameDay(d, selectedDay));
                  } else {
                    _selectedDays.add(selectedDay);
                  }
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
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
                  bool isUnavailable =
                      _unavailableDays.any((d) => isSameDay(d, date));
                  int? price = priceData[date];

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
                    ],
                  );
                },
              ),
            ),
              const Divider(),
            const Spacer(),
              Text('Reservation start & end',style: Styles.fontSize14RegularGrey,),
              Row(
                children: [
                  Text('Thu, 02 Dec 2022',style: Styles.fontSize14RegularGrey.copyWith(color: Colors.black),),
                  const SizedBox(width: 90,),
                  Text('Thu, 02 Dec 2022',style: Styles.fontSize14RegularGrey.copyWith(color: Colors.black),),
                ],
              ),
              const SizedBox(height: 10,),
              Text('EGP 360',style: Styles.fontSize16Bold,),
              const Spacer(),
              CustomButton(
                buttonColor:_selectedDays.isEmpty?const Color(0xffFECAA2):null,
                text: 'Save',
                onPressed: _selectedDays.isNotEmpty?(){
                 AppUtil.mainNavigator(context, const ReservationSuccessfullyView());
                }:(){},

              )
          ],
        ),
      ),
    );
  }
}
