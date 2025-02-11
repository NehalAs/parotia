import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/custom_button.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/modules/owner_modules/edit_price/presentation/widgets/dates_range_row.dart';
import '../../../../../core/shared_components/back_item.dart';
import '../../../../../core/utils/styles.dart';

class EditPriceView extends StatelessWidget {
  const EditPriceView({super.key, required this.days});
  final List<DateTime> days;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackItem(radius: 15,),
              const SizedBox(height: 20),
              Text('Edit Price', style: Styles.fontSize28Bold),
              Text('You can change it anytime.',
                  style: Styles.fontSize16RegularGrey),
              const SizedBox(
                height: 20,
              ),
              DatesRangeRow(isOneDayOnly: days.length == 1),
              const SizedBox(
                height: 40,
              ),
              Text('Price per day', style: Styles.fontSize16RegularGrey),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffFAFAFA),
                      border:buildBorderStyle(),
                     focusedBorder:buildBorderStyle() ,
                    disabledBorder: buildBorderStyle(),
                    enabledBorder: buildBorderStyle(),
                    suffix: const Text('K.D')
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(text: 'Save changes', onPressed: () {},)
            ],
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorderStyle()
{
  return  OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Color(0xffE9E9E9),width: 2),
  );
}