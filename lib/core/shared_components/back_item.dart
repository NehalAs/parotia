import 'package:flutter/material.dart';

class BackItem extends StatelessWidget {
  const BackItem({super.key,  this.isCloseIcon=false});
  final bool isCloseIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: CircleAvatar(
            radius: 40,
              backgroundColor:Colors.grey[300],
            child:  Icon(isCloseIcon?Icons.close:Icons.arrow_back_ios,size: 15,)),
      ),
    );
  }
}
