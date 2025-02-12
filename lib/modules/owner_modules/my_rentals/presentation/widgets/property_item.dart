import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/modules/owner_modules/my_rentals/models/rental_model.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/apartment_info.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/images_page_view.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/my_rentals_bottom_sheet.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({super.key, required this.rentalModel});
  final RentalModel rentalModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>showModalBottomSheet(context:context,builder: (context) => const MyRentalsBottomSheet()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImagesPageView(images: rentalModel.images,),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ApartmentInfo(rentalModel:rentalModel),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.orange0B,
            size: 20,
          ),
        ],
      ),
    );
  }
}
