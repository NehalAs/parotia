import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_util.dart';
import 'package:parotia/modules/owner_modules/calender/presentation/views/calender_view.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/bottom_sheet_header.dart';

import '../../../../../core/utils/styles.dart';

class MyRentalsBottomSheet extends StatelessWidget {
  const MyRentalsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 300,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:16,horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHeader(title: 'My Rentals'),
            InkWell(
              onTap: () => AppUtil.mainNavigator(context,const CalenderView()),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text('Edit Calendar',style: Styles.fontSize20Regular,),
                ),
              ),
            ),
            const Divider(),

          ],
        ),
      ),
    );
  }
}
