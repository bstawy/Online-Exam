// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../main.dart';
import 'assets_manager.dart';

void showSuccessDialog({VoidCallback? whenAnimationFinished}) async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) {
      return SuccessDialog(whenAnimationFinished);
    },
  );
}

class SuccessDialog extends StatelessWidget {
  final VoidCallback? whenAnimationFinished;

  const SuccessDialog(this.whenAnimationFinished, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 120.w,
        height: 120.h,
        child: Center(
          child: Lottie.asset(
            AssetsManager.successAnimation,
            repeat: false,
            fit: BoxFit.fitWidth,
            onLoaded: (composition) {
              Future.delayed(
                composition.duration,
                () {
                  Navigator.of(context).pop();
                  if (whenAnimationFinished != null) {
                    whenAnimationFinished!();
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
