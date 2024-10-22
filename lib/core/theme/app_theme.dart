import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';
import 'font_weight_helper.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.lightWhite,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.blue,
      surface: ColorsManager.lightWhite,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: ColorsManager.blue,
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.medium,
        fontFamily: 'Poppins',
      ),
      headlineSmall: TextStyle(
        color: ColorsManager.black,
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.medium,
        fontFamily: 'Poppins',
      ),
      labelLarge: TextStyle(
        color: ColorsManager.lightWhite,
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        fontFamily: 'Poppins',
      ),
      bodyLarge: TextStyle(
        color: ColorsManager.black,
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        fontFamily: 'Poppins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.lightWhite,
      elevation: 0,
      iconTheme: const IconThemeData(color: ColorsManager.black),
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: ColorsManager.black,
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.medium,
      ),
    ),
  );
}
