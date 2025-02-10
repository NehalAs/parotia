import 'package:flutter/material.dart';
import 'package:parotia/core/utils/styles.dart';
import 'package:parotia/modules/owner_modules/make_reservation/presentation/widgets/property_buttons_row.dart';

class ApartmentInfo extends StatelessWidget {
  const ApartmentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sahary Apartment',
          style: Styles.fontSize18Bold,
        ),
        Text(
          'AI Jahra,kuwait',
          style: Styles.fontSize16Regular,
        ),
        const SizedBox(
          height: 5,
        ),
        const PropertyButtonsRow(),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and Vel quia culpa quo expedita harum ad. ',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.fontSize14Regular,
        ),
        Text(
          '8 Guests - Male only',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.fontSize14Regular.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
