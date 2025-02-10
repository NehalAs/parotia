import 'package:flutter/material.dart';
import 'package:parotia/core/utils/app_colors.dart';
import 'package:parotia/modules/owner_modules/make_reservation/presentation/widgets/apartment_info.dart';
import 'package:parotia/modules/owner_modules/make_reservation/presentation/widgets/images_page_view.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // PageView.builder(itemBuilder: (context, index) =>const Image(image: NetworkImage('https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXBhcnRtZW50fGVufDB8fDB8fHww')) ,),
        ImagesPageView(),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: ApartmentInfo(),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.orange0B,
          size: 20,
        ),
      ],
    );
  }
}
