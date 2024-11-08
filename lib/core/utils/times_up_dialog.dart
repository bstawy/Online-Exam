// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/extensions/theme_ext.dart';

import '../../features/authentication/presentation/widgets/custom_button.dart';
import '../../main.dart';
import 'assets_manager.dart';

void showTimesUpDialog(VoidCallback onTap) async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) {
      return TimesUpDialog(onTap);
    },
  );
}

class TimesUpDialog extends StatelessWidget {
  final VoidCallback? onTap;

  const TimesUpDialog(this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 86.h,
            width: 45.w,
            child: Image.asset(
              AssetsManager.sandClockImage,
            ),
          ),
          Text(
            "Times UP!",
            textAlign: TextAlign.center,
            style: customTextStyles.labelLarge?.copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
      actions: [
        CustomButton(
          onPressed: onTap,
          text: 'View Score',
        ),
      ],
    );
  }
}
