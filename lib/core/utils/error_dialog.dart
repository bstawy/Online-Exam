import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../main.dart';
import '../extensions/navigation_ext.dart';
import '../extensions/theme_ext.dart';
import '../theme/colors_manager.dart';
import 'assets_manager.dart';

void showErrorDialog(String? errorMsg) async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) => ErrorDialog(errorMsg),
  );
}

class ErrorDialog extends StatelessWidget {
  final String? errorMsg;
  const ErrorDialog(this.errorMsg, {super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        height: 0.25.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120.h,
              width: 120.w,
              child: Lottie.asset(
                AssetsManager.errorAnimation,
                repeat: false,
                fit: BoxFit.fitWidth,
              ),
            ),
            Gap(16.h),
            Text(
              errorMsg ?? 'An error occurred',
              textAlign: TextAlign.center,
              style: customTextStyles.labelLarge?.copyWith(
                color: ColorsManager.black,
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: customColors.inverseSurface,
          ),
          child: Text(
            "Got it",
            style: customTextStyles.labelLarge?.copyWith(
              color: ColorsManager.lightWhite,
            ),
          ),
        ),
      ],
    );
  }
}
