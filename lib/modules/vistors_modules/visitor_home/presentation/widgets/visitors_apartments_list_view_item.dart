import 'package:flutter/material.dart';
import 'package:parotia/core/utils/styles.dart';
import 'package:parotia/modules/owner_modules/my_rentals/models/rental_model.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/select_reservation_bottom_sheet.dart';
import '../../../../../core/utils/app_util.dart';
import '../../../../owner_modules/my_rentals/presentation/widgets/images_page_view.dart';

class VisitorsApartmentsListViewItem extends StatelessWidget {
  const VisitorsApartmentsListViewItem({super.key, required this.rentalModel});

  final RentalModel rentalModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(builder: (context) => const SelectReservationBottomSheet(), context: context,),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagesPageView(
            height: AppUtil.responsiveWidth(context)-90,
            width: double.infinity,
            haveFavIcon: true, images: rentalModel.images,
          ),
          const SizedBox(height: 16,),
          Text(rentalModel.name!,style: Styles.fontSize18Bold,),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text('per day',style: Styles.fontSize14RegularGrey,))

        ],
      ),
    );
  }
}
