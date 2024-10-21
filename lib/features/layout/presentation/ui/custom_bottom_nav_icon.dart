import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors_manager.dart';

class CustomBottomNavIcon extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  const CustomBottomNavIcon({
    super.key,
    required this.iconPath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: isSelected ? const Color(0xFFCCD7EB) : ColorsManager.lighterBlue,
      ),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? ColorsManager.blue : ColorsManager.lightGrey,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
