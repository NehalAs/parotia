import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/image_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesPageView extends StatelessWidget {
  ImagesPageView({super.key,  this.height=150,  this.width=150,  this.haveFavIcon=false, required this.images});

  final PageController pageController = PageController();
  final double? height;
  final double? width;
  final bool haveFavIcon;
  final List<String>? images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => ImageItem(image:images![index]),
              itemCount: images?.length,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SmoothPageIndicator(
                count: images!.length,
                controller: pageController,
                effect:  SlideEffect(
                    spacing: 6,
                    dotWidth:  8,
                    dotHeight:  8,
                    dotColor:  Colors.grey[400]!,
                    activeDotColor: Colors.orangeAccent
                ),
              ),
            ),
            if(haveFavIcon)
              const Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(CupertinoIcons.heart_fill,color: AppColors.orange2E,))),
            )
          ],
        ));
  }
}
