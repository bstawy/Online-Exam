import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/theme/colors_manager.dart';
import '../../../../../../core/theme/font_weight_helper.dart';
import '../widgets/pin_put_widget.dart';
import 'reset_password_page.dart';

class PinVerificationPage extends StatelessWidget {
  static const String routeName = '/pin-verification';

  const PinVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin Verification'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(40.h),
              Text(
                'Email verification',
                textAlign: TextAlign.center,
                style: customTextStyles.headlineSmall,
              ),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Text(
                  'Please enter your code that send to your email address',
                  textAlign: TextAlign.center,
                  style: customTextStyles.bodyLarge?.copyWith(
                    color: ColorsManager.grey,
                  ),
                ),
              ),
              Gap(32.h),
              const PinPutWidget(),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: customTextStyles.labelLarge?.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(ResetPasswordPage.routeName);
                    },
                    borderRadius: BorderRadius.circular(15.r),
                    child: RichText(
                      text: TextSpan(
                        text: 'Resend',
                        style: customTextStyles.labelLarge?.copyWith(
                          color: ColorsManager.blue, // Text color
                          fontWeight: FontWeightHelper.medium,
                          decoration:
                              TextDecoration.underline, // Underline the text
                          decorationColor:
                              ColorsManager.blue, // Set the underline color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
