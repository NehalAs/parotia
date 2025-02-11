import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';

import '../../../../../core/utils/styles.dart';

class ReservationTypeItem extends StatelessWidget {
  const ReservationTypeItem({super.key, required this.isSelected, required this.onTap, required this.text});
  final bool isSelected;
  final Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orange2E : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: !isSelected?Border.all(color: Colors.grey):null
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          style: Styles.fontSize16RegularGrey
              .copyWith(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
