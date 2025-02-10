import 'package:flutter/material.dart';

import '../../../core/shared_components/back_item.dart';
import '../../../core/utils/styles.dart';

class EditPrice extends StatelessWidget {
  const EditPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackItem(
                isCloseIcon: true,
                radius: 15,
              ),
              const SizedBox(height: 20),
              Text('Edit Price', style: Styles.fontSize28Bold),
              Text('You can change it anytime.', style: Styles.fontSize16RegularGrey),
            ],
          ),
        ),
      ),
    );
  }
}
