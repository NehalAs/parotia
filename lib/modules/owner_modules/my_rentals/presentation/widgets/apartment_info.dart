import 'package:flutter/material.dart';
import 'package:parotia/core/utils/styles.dart';
import 'package:parotia/modules/owner_modules/my_rentals/models/rental_model.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/property_buttons_row.dart';

class ApartmentInfo extends StatelessWidget {
  const ApartmentInfo({super.key, required this.rentalModel});
  final RentalModel rentalModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rentalModel.name!,
          style: Styles.fontSize18Bold,
        ),
        Text(
          rentalModel.address!,
          style: Styles.fontSize16RegularGrey,
        ),
        const SizedBox(
          height: 5,
        ),
        const PropertyButtonsRow(),
        const SizedBox(
          height: 10,
        ),
        Text(
          rentalModel.description!,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.fontSize14RegularGrey,
        ),
        Text(
          '${rentalModel.guests!} Guests - Male only',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.fontSize14RegularGrey.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
