import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/custom_button.dart';
import 'package:parotia/core/utils/app_util.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/views/visitor_home_view.dart';

import '../../../../../core/utils/styles.dart';

class ReservationSuccessfullyView extends StatelessWidget {
  const ReservationSuccessfullyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Reservation Successfully',
                style: Styles.fontSize18Bold,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  'Elementum nisl accumsan, urna ipsum sapien pulvinar. Est, eget pellentesque fermentum sed massa sit id iaculis vitae.',
                  style: Styles.fontSize16RegularGrey,
                ),
              ),
              const Spacer(),
              CustomButton(text: 'Ok', onPressed: () {
                AppUtil.removeUntilNavigator(context, const VisitorHomeView());
              },),
            ],
          ),

      ),
    );
  }
}
