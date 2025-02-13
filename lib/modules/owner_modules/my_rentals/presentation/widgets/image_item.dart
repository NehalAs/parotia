import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
          height: 150,
          width: 150,
          fit: BoxFit.cover,
          image: NetworkImage(image)),
    );
  }
}
