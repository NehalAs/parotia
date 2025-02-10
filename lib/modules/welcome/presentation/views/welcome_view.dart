import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_util.dart';
import '../../../../core/shared_components/custom_button.dart';
import '../../../owner_modules/my_rentals/presentation/views/make_rentals_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(text: 'Owner Flow', onPressed: () => AppUtil.mainNavigator(context,const MakeRentalsView()),),
              const SizedBox(height: 20,),
              CustomButton(text: 'Visitor Flow', onPressed: () {},),
            ],
          ),
        ),
      ),
    );
  }
}
