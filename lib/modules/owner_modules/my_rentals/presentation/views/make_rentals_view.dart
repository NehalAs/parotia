import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/back_item.dart';
import 'package:parotia/modules/owner_modules/my_rentals/presentation/widgets/property_item.dart';

class MakeRentalsView extends StatelessWidget {
  const MakeRentalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Rentals',
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackItem(),
        ),
        leadingWidth: 50,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) => const PropertyItem(),
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
        ),
      ),
    );
  }
}
