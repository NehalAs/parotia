import 'package:flutter/material.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/per_night_widget.dart';

class PropertyButtonsRow extends StatelessWidget {
  const PropertyButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        PerNightWidget(text: 'Per night'),
        SizedBox(width: 10,),
        PerNightWidget(text: 'Package'),
      ],
    );
  }
}
