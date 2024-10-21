import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/font_weight_helper.dart';
import '../../../../core/utils/assets_manager.dart';
import 'custom_bottom_nav_icon.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = '/layout';
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) {
    _currentIndex = index;

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Result'),
          ),
          Center(
            child: Text('Profile'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _animateToPage,
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
              isSelected: _currentIndex == 0,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              iconPath: AssetsManager.resultsNavBarIcon,
              isSelected: _currentIndex == 1,
            ),
            label: 'Result',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              iconPath: AssetsManager.profileNavBarIcon,
              isSelected: _currentIndex == 2,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
