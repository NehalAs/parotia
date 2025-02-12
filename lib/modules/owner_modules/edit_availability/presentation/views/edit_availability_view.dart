import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/back_item.dart';
import 'package:parotia/core/utils/styles.dart';
import 'package:parotia/modules/owner_modules/edit_price/presentation/widgets/dates_range_row.dart';

import '../../../../../core/shared_components/custom_button.dart';

class EditAvailabilityView extends StatelessWidget {
  const EditAvailabilityView({super.key, required this.days});
  final List<DateTime> days;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackItem(radius: 15,),
              const SizedBox(height: 20),
              Text('Edit Availability', style: Styles.fontSize28Bold),
              Text('You can change it anytime.', style: Styles.fontSize16RegularGrey),
              const SizedBox(height: 20,),
              DatesRangeRow(isOneDayOnly: days.length==1, days: days,),
              const SizedBox(height: 20,),
              const Divider(),
              const SizedBox(height: 30,),
              Text('Block Dates', style: Styles.fontSize16Bold),
              const SizedBox(height: 5,),
              Text('Block the range of dates', style: Styles.fontSize14RegularGrey),
              const Spacer(),
              CustomButton(text: 'Save changes', onPressed: () {},)
            ],
          ),
        ),
      ),
    );
  }
}
