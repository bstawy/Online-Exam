import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font20BlueMedium = TextStyle(
    color: ColorsManager.blue,
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Poppins',
  );

  static TextStyle font18BlackMedium = TextStyle(
    color: ColorsManager.black,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Poppins',
  );

  static TextStyle font16LightWhiteMedium = TextStyle(
    color: ColorsManager.lightWhite,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Poppins',
  );

  static TextStyle font14GreyMedium = TextStyle(
    color: ColorsManager.grey,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Poppins',
  );

  static TextStyle font14BlackRegular = TextStyle(
    color: ColorsManager.black,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Poppins',
  );
}
