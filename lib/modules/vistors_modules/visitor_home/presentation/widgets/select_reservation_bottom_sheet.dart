import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/back_item.dart';
import 'package:parotia/core/shared_components/custom_button.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/reservation_type_item.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/visitor_calender_bottom_sheet.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../owner_modules/my_rentals/models/rental_model.dart';

class SelectReservationBottomSheet extends StatefulWidget {
  const SelectReservationBottomSheet({super.key, required this.rentalModel});

  final RentalModel rentalModel;
  @override
  State<SelectReservationBottomSheet> createState() => _SelectReservationBottomSheetState();
}

class _SelectReservationBottomSheetState extends State<SelectReservationBottomSheet> {
  String currentSelectedPackage='Per day';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:16,horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackItem(isCloseIcon: true,radius: 15,),
            const SizedBox(height: 20,),
            Text('Select reservation type',style: Styles.fontSize20Regular.copyWith(fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            ReservationTypeItem(isSelected: currentSelectedPackage=='Per day', onTap: () {
              setState(() {
                currentSelectedPackage='Per day';
              });
            }, text: 'Per day',),
            const SizedBox(height: 10,),
            ReservationTypeItem(isSelected: currentSelectedPackage=='Package (One week)', onTap: () {
              setState(() {
                currentSelectedPackage='Package (One week)';
              });
            }, text: 'Package (One week)',),
            const SizedBox(height: 10,),
            ReservationTypeItem(isSelected:currentSelectedPackage=='Package (Weekend)', onTap: () {
              setState(() {
                currentSelectedPackage='Package (Weekend)';
              });
            }, text: 'Package (Weekend)',),
            const SizedBox(height: 10,),
            ReservationTypeItem(isSelected: currentSelectedPackage=='Package (Week days)', onTap: () {
              setState(() {
                currentSelectedPackage='Package (Week days)';
              });
            }, text: 'Package (Week days)',),
            const Spacer(),
            CustomButton(text: 'Confirm', onPressed: () {
              Navigator.pop(context);
              showModalBottomSheet(context: context, builder: (context) => VisitorCalenderBottomSheet(rentalModel:widget.rentalModel),isScrollControlled: true,);
            },)
          ],
        ),
      ),
    );
  }
}
