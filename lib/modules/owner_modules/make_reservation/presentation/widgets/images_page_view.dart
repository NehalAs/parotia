import 'package:flutter/material.dart';
import 'package:parotia/modules/owner_modules/make_reservation/presentation/widgets/image_item.dart';

class ImagesPageView extends StatelessWidget {
  const ImagesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 150,
        width: 150,
        child: PageView.builder(itemBuilder: (context, index) => ImageItem(),));
  }
}
