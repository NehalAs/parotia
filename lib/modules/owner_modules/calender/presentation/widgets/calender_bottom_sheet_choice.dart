import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_util.dart';
import 'package:parotia/core/utils/styles.dart';

class CalenderBottomSheetChoice extends StatelessWidget {
  const CalenderBottomSheetChoice({super.key, required this.navigatorScreen, required this.text});
  final Widget navigatorScreen;
  final String text;
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: () => AppUtil.mainNavigator(context, navigatorScreen),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(text,style: Styles.fontSize16Bold.copyWith(fontWeight: FontWeight.w400),),
        ),
      ),
    );
  }
}
