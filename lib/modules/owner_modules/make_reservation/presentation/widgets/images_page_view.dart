import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/modules/owner_modules/make_reservation/presentation/widgets/image_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesPageView extends StatelessWidget {
  ImagesPageView({super.key});

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        width: 150,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => const ImageItem(),
              itemCount: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SmoothPageIndicator(
                count: 5,
                controller: pageController,
                effect:  SlideEffect(
                    spacing: 6,
                    dotWidth:  8,
                    dotHeight:  8,
                    dotColor:  Colors.grey[400]!,
                    activeDotColor: Colors.orangeAccent
                ),
              ),
            )
          ],
        ));
  }
}
