import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parotia/core/shared_components/custom_svg.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/my_tabBar.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/presentation/widgets/search_banner_item.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/assets.dart';

class VisitorHomeView extends StatefulWidget {
  const VisitorHomeView({super.key});

  @override
  State<VisitorHomeView> createState() => _VisitorHomeViewState();
}

class _VisitorHomeViewState extends State<VisitorHomeView> {
  int currentTapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SearchBannerItem(),
                const SizedBox(
                  height: 20,
                ),
                TabBar(
                    indicatorColor: AppColors.orange2E,
                    labelColor: AppColors.orange2E,
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: const TextStyle(),
                    isScrollable: true,
                    overlayColor: WidgetStatePropertyAll(
                        AppColors.orange2E.withOpacity(0.1)),
                    tabAlignment: TabAlignment.start,
                    onTap: (index) {
                      setState(() {
                        currentTapIndex = index;
                      });
                    },
                    tabs: [
                      CustomTab(currentTapIndex: currentTapIndex, text: 'Marine Area', icon: Assets.svgsMarina,index: 0,),
                      CustomTab(currentTapIndex: currentTapIndex, text: 'Wilderness Area', icon: Assets.svgsWild,index: 1,),
                      CustomTab(currentTapIndex: currentTapIndex, text: 'Desert Area', icon: Assets.svgsDesert,index: 2,),
                      CustomTab(currentTapIndex: currentTapIndex, text: 'Mountainous', icon: Assets.svgsMountain,index: 3,),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
