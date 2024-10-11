import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../main.dart';
import 'assets_manager.dart';

void showSuccessDialog() async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) => const SuccessDialog(),
  );
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Center(
          child: Lottie.asset(
            AssetsManager.successAnimation,
            repeat: true,
          ),
        ),
      ),
    );
  }
}
