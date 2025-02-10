import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/core/utils/styles.dart';

class PerNightWidget extends StatelessWidget {
  const PerNightWidget({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical:2,horizontal: 12),
      decoration: BoxDecoration(
          color: AppColors.orange0B.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),border: Border.all(color:AppColors.orange0B)),
      child:  Text(text,style: Styles.fontSize12Regular,),
    );
  }
}
