import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ReservationSuccessfullyView extends StatelessWidget {
  const ReservationSuccessfullyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Reservation Successfully',style: Styles.fontSize18Bold,)
        ],
      ),
    );
  }
}
