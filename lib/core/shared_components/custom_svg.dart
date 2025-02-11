import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({super.key, required this.icon,  this.color,  this.size});
  final String icon;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(icon,color:color,height: size,width:size,);
  }
}
