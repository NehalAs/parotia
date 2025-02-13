import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/core/shared_components/back_item.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/core/utils/app_util.dart';
import 'package:parotia/core/utils/styles.dart';
import 'package:parotia/modules/owner_modules/edit_availability/view_model/cubit/edit_availability_cubit.dart';
import 'package:parotia/modules/owner_modules/edit_price/presentation/widgets/dates_range_row.dart';
import 'package:parotia/modules/welcome/presentation/views/welcome_view.dart';
import '../../../../../core/shared_components/custom_button.dart';
import '../../view_model/cubit/edit_availability_state.dart';

class EditAvailabilityView extends StatelessWidget {
  const EditAvailabilityView(
      {super.key, required this.days, required this.rentalId});
  final List<DateTime> days;
  final String rentalId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => EditAvailabilityCubit()
          ..getCurrentSwitchValue(rentalId: rentalId, days: days),
        child: BlocBuilder<EditAvailabilityCubit, EditAvailabilityState>(
            builder: (context, state) {
          EditAvailabilityCubit editAvailabilityCubit =
              EditAvailabilityCubit.get(context);

          if (state is EditAvailabilitySuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Days Availability Edited Successfully"),
              ));
              AppUtil.removeUntilNavigator(context, const WelcomeView());
            });
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackItem(
                    radius: 15,
                  ),
                  const SizedBox(height: 20),
                  Text('Edit Availability', style: Styles.fontSize28Bold),
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
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text('Block Dates', style: Styles.fontSize16Bold),
                      const Spacer(),
                      Switch(
                        activeTrackColor: AppColors.orange0B,
                        inactiveTrackColor: Colors.grey[400],
                        inactiveThumbColor: Colors.white,
                        activeColor: Colors.white,
                        trackOutlineWidth: const WidgetStatePropertyAll(0),
                        trackOutlineColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        thumbIcon: const WidgetStatePropertyAll(Icon(
                          Icons.circle,
                          color: Colors.white,
                        )),
                        value: editAvailabilityCubit.blocDatesSwitch,
                        onChanged: (value) => editAvailabilityCubit
                            .changeSwitchValue(newValue: value),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Block the range of dates',
                      style: Styles.fontSize14RegularGrey),
                  const Spacer(),
                  if (state is EditAvailabilityLoadingState)
                    const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.orange0B,
                    )),
                  if (state is! EditAvailabilityLoadingState)
                    CustomButton(
                      text: 'Save changes',
                      onPressed: () => editAvailabilityCubit
                          .editDaysAvailability(days: days, rentalId: rentalId),
                    )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
