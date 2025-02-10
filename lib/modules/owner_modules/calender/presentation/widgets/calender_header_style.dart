import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';


  @override
  HeaderStyle calenderHeaderStyle(BuildContext context) {
    return   const HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      leftChevronIcon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.orange0B,
      ),
      rightChevronIcon: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.orange0B,
      ),
    );
  }

