import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/theme/colors_manager.dart';
import '../pages/reset_password_page.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: customTextStyles.headlineMedium,
      decoration: BoxDecoration(
        color: ColorsManager.lightBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
    // TODO: call verify otp api
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      onCompleted: (pin) => context.pushNamed(ResetPasswordPage.routeName),
    );
  }
}
