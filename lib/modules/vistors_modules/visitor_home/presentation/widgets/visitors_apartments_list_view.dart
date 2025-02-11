import 'package:flutter/material.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/visitors_apartments_list_view_item.dart';

class VisitorsApartmentsListView extends StatelessWidget {
  const VisitorsApartmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) => const VisitorsApartmentsListViewItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 30,), itemCount: 3,
    ));
  }
}
