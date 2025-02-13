import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/core/shared_components/back_item.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/property_item.dart';
import 'package:parotia/modules/owner_modules/my_rentals/view_model/cubit/my_rentals_cubit.dart';

import '../../view_model/cubit/my_rentals_state.dart';

class MyRentalsView extends StatelessWidget {
  const MyRentalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRentalsCubit(),
      child: BlocBuilder<MyRentalsCubit, MyRentalsState>(
        builder: (context, state) {
          MyRentalsCubit myRentalsCubit=MyRentalsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'My Rentals',
              ),
              leading: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: BackItem(),
              ),
              leadingWidth: 50,
              centerTitle: true,
            ),
            body: state is GetMyRentalsLoadingState?const Center(child: CircularProgressIndicator(color: AppColors.orange0B,)):Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemBuilder: (context, index) => PropertyItem(rentalModel:myRentalsCubit.myRentals[index]),
                itemCount: myRentalsCubit.myRentals.length,
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
