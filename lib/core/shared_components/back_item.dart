import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';

class BackItem extends StatelessWidget {
  const BackItem({super.key,  this.isCloseIcon=false,this.radius});
  final bool isCloseIcon;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: CircleAvatar(
          radius:radius?? 40,
            backgroundColor: AppColors.greyEE,
          child:  Icon(isCloseIcon?Icons.close:Icons.arrow_back_ios,size: 15,)),
    );
  }
}
