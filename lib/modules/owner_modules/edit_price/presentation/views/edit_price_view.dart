import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/core/shared_components/custom_button.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/core/utils/app_util.dart';
import 'package:parotia/modules/owner_modules/calender/presentation/views/calender_view.dart';
import 'package:parotia/modules/owner_modules/calender/view_model/cubit/calender_state.dart';
import 'package:parotia/modules/owner_modules/edit_price/presentation/widgets/dates_range_row.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/views/make_rentals_view.dart';
import 'package:parotia/modules/welcome/presentation/views/welcome_view.dart';
import '../../../../../core/shared_components/back_item.dart';
import '../../../../../core/utils/styles.dart';
import '../../../calender/view_model/cubit/calender_cubit.dart';

class EditPriceView extends StatelessWidget {
  EditPriceView({super.key, required this.days, required this.rentalId});

  final List<DateTime> days;
  final String rentalId;
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalenderCubit(),
      child: BlocBuilder<CalenderCubit, CalenderState>(
        builder: (context, state) {
          CalenderCubit calenderCubit = CalenderCubit.get(context);
          if (state is EditPricesSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Price Edited Successfully"),
              ));
              AppUtil.removeUntilNavigator(context, const WelcomeView());
            });
          }
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackItem(
                      radius: 15,
                    ),
                    const SizedBox(height: 20),
                    Text('Edit Price', style: Styles.fontSize28Bold),
                    Text('You can change it anytime.',
                        style: Styles.fontSize16RegularGrey),
                    const SizedBox(
                      height: 20,
                    ),
                    DatesRangeRow(
                      isOneDayOnly: days.length == 1,
                      days: days,
                    ),
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
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffFAFAFA),
                            border: buildBorderStyle(),
                            focusedBorder: buildBorderStyle(),
                            disabledBorder: buildBorderStyle(),
                            enabledBorder: buildBorderStyle(),
                            suffix: const Text('K.D')),
                      ),
                    ),
                    const Spacer(),
                    if (state is EditPricesLoadingState)
                      const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.orange0B,
                      )),
                    if (state is! EditPricesLoadingState)
                      CustomButton(
                          text: 'Save changes',
                          onPressed: () => calenderCubit.editDaysPrices(
                                rentalId: (rentalId),
                                days: days,
                                newPrice: int.parse(priceController.text),
                              )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

OutlineInputBorder buildBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Color(0xffE9E9E9), width: 2),
  );
}
