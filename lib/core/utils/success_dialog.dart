// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/core/extensions/theme_ext.dart';

import '../../main.dart';
import '../theme/colors_manager.dart';
import 'assets_manager.dart';

void showSuccessDialog({
  String? msg,
  VoidCallback? whenAnimationFinished,
}) async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) {
      return SuccessDialog(msg: msg, whenAnimationFinished);
    },
  );
}

class SuccessDialog extends StatelessWidget {
  final String? msg;
  final VoidCallback? whenAnimationFinished;

  const SuccessDialog(this.whenAnimationFinished, {super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: msg == null
          ? SizedBox(
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
            )
          : SizedBox(
              height: 0.25.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.h,
                    width: 120.w,
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
                  Gap(16.h),
                  Text(
                    msg!,
                    textAlign: TextAlign.center,
                    style: customTextStyles.labelLarge?.copyWith(
                      color: ColorsManager.black,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
