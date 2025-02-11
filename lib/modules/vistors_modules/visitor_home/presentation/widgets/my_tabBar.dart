import 'package:flutter/material.dart';
import '../../../../../core/shared_components/custom_svg.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/assets.dart';



class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.currentTapIndex, required this.text, required this.icon, required this.index});

  final int currentTapIndex;
  final int index;
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {

    return Tab(
      icon: CustomSvg(
        icon: icon,
        size: 30,
        color: currentTapIndex == index
            ? AppColors.orange2E
            : Colors.grey,
      ),
      text: text,
    );
  }
}
