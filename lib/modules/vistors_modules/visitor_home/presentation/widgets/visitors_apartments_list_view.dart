import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/visitors_apartments_list_view_item.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../view_model/cubit/visitor_home_cubit.dart';
import '../../view_model/cubit/visitor_home_state.dart';

class VisitorsApartmentsListView extends StatelessWidget {
  const VisitorsApartmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    VisitorHomeCubit visitorHomeCubit=VisitorHomeCubit.get(context);
    return BlocBuilder<VisitorHomeCubit, VisitorHomeState>(
      builder: (context,state) {
        return state is GetAllRentalsLoadingState?const Center(child: CircularProgressIndicator(color: AppColors.orange0B,)):Expanded(
            child: ListView.separated(
          itemBuilder: (context, index) => VisitorsApartmentsListViewItem(rentalModel:visitorHomeCubit.allRentals[index],),
          separatorBuilder: (context, index) => const SizedBox(height: 30,), itemCount: visitorHomeCubit.allRentals.length,
        ));
      }
    );
  }
}
