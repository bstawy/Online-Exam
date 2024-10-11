import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../main.dart';
import 'assets_manager.dart';

void showLoadingDialog() async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) => const LoadingDialog(),
  );
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Center(
          child: Lottie.asset(
            AssetsManager.loadingAnimation,
            repeat: true,
          ),
        ),
      ),
    );
  }
}
