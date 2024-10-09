import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';
import 'font_weight_helper.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.lightWhite,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.blue,
      surface: ColorsManager.lightWhite,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: ColorsManager.lightWhite,
        fontSize: 16,
        fontWeight: FontWeightHelper.medium,
      ),
      bodyLarge: TextStyle(
        color: ColorsManager.black,
        fontSize: 14,
        fontWeight: FontWeightHelper.regular,
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
