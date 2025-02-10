import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/modules/owner_modules/make_reservation/presentation/widgets/apartment_info.dart';
import 'package:parotia/modules/owner_modules/make_reservation/presentation/widgets/images_page_view.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImagesPageView(),
          const SizedBox(
            width: 20,
          ),
          const Expanded(
            child: ApartmentInfo(),
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
