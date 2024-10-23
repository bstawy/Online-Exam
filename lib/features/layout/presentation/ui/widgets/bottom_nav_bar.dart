import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/font_weight_helper.dart';
import '../../../../../core/utils/assets_manager.dart';
import 'custom_bottom_nav_icon.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) animateToPage;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.animateToPage,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: animateToPage,
      backgroundColor: ColorsManager.lighterBlue,
      selectedLabelStyle: TextStyle(
        color: ColorsManager.blue,
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: CustomBottomNavIcon(
            iconPath: AssetsManager.homeNavBarIcon,
            isSelected: currentIndex == 0,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: CustomBottomNavIcon(
            iconPath: AssetsManager.resultsNavBarIcon,
            isSelected: currentIndex == 1,
          ),
          label: 'Result',
        ),
        BottomNavigationBarItem(
          icon: CustomBottomNavIcon(
            iconPath: AssetsManager.profileNavBarIcon,
            isSelected: currentIndex == 2,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
