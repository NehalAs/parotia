import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed, this.buttonColor});
  final String text;
  final Function() onPressed;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style:  ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(buttonColor??AppColors.orange0B)),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.fontSize18Regular,
          )),
    );
  }
}
