import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../main.dart';
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
    return AlertDialog(
      content: IntrinsicHeight(
        child: Column(
          children: [
            Lottie.asset(
              AssetsManager.errorAnimation,
              repeat: false,
            ),
            Gap(16.h),
            Text(errorMsg ?? 'An error occurred'),
          ],
        ),
      ),
    );
  }
}
