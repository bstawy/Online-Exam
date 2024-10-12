import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/theme/colors_manager.dart';
import '../widgets/reset_password_form_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  static const String routeName = '/reset-password';

  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(40.h),
              Text(
                'Reset password',
                textAlign: TextAlign.center,
                style: customTextStyles.headlineSmall,
              ),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Password must not be empty and must contain 6 characters with upper case letter and one number at least',
                  textAlign: TextAlign.center,
                  style: customTextStyles.bodyLarge?.copyWith(
                    color: ColorsManager.grey,
                  ),
                ),
              ),
              Gap(32.h),
              const ResetPasswordFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
