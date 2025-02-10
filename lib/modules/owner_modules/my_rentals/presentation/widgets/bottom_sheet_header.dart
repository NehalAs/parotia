import 'package:flutter/material.dart';
import 'package:parotia/core/utils/styles.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(title,style: Styles.fontSize16Bold,),
            const Spacer(),
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close,size: 20,)),
          ],
        ),
        const Divider(),

      ],
    );
  }
}
