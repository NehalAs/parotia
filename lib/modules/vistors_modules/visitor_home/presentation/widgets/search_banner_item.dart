import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/custom_svg.dart';
import 'package:parotia/core/utils/app_colors.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../generated/assets.dart';

class SearchBannerItem extends StatelessWidget {
  const SearchBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),boxShadow: const [
        BoxShadow(
          color: AppColors.greyEE,
          blurRadius: 4,
          offset: Offset(4, 6), // Shadow position
        ),
      ],),
      child: Row(
        children: [
          const CustomSvg(icon: Assets.svgsSearch,color: AppColors.orange2E,size: 28,),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Where do you want to go?',style: Styles.fontSize16Bold,),
                Text('All Kuwait - Any week -  Add guests',style: Styles.fontSize14RegularGrey,),
              ],
            ),
          ),
          const CustomSvg(icon: Assets.svgsFilter,),
        ],
      ),
    );
  }
}
