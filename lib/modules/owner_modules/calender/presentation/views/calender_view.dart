import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/back_item.dart';
import 'package:parotia/core/shared_components/custom_button.dart';
import 'package:parotia/core/shared_components/custom_table_calender.dart';
import 'package:parotia/modules/owner_modules/calender/presentation/widgets/calender_bottom_sheet.dart';
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
  List<DateTime> selectedDays = [];

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
              CustomTableCalender(
                selectedDays: selectedDays,
                rentalModel: widget.rentalModel,
                onDaySelected: (selectedDay, focusedDay) {
                  if (isSameDay(selectedDay, DateTime.now())) {
                    return; // Prevent selection of unavailable days
                  }
                  setState(() {
                    if (selectedDays.any((d) => isSameDay(d, selectedDay))) {
                      selectedDays.removeWhere((d) => isSameDay(d, selectedDay));
                    } else {
                      selectedDays.add(selectedDay);
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              const Divider(color: AppColors.greyEE),
              const Spacer(),
              CustomButton(
                buttonColor:
                    selectedDays.isEmpty ? const Color(0xffFECAA2) : null,
                text: 'Edit Days',
                onPressed: selectedDays.isEmpty
                    ? () {}
                    : () => showModalBottomSheet(
                          context: context,
                          builder: (context) => CalenderBottomSheet(
                            selectedDays: selectedDays,
                            rentalId: widget.rentalModel.id!,
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
