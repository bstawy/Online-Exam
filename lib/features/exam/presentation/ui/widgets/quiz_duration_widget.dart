import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../cubit/exam_cubit.dart';

class QuizDuration extends StatefulWidget {
  final num duration;

  const QuizDuration({
    super.key,
    required this.duration,
  });

  @override
  State<QuizDuration> createState() => _QuizDurationState();
}

class _QuizDurationState extends State<QuizDuration> {
  late Duration remainingDuration;
  late int remainingMinutes;
  late int remainingSeconds;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    remainingDuration = Duration(minutes: widget.duration.toInt());
    remainingMinutes = remainingDuration.inMinutes;
    remainingSeconds = remainingDuration.inSeconds % 60;
    startTimer();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingDuration.inSeconds > 0) {
        remainingDuration = Duration(seconds: remainingDuration.inSeconds - 1);
        remainingMinutes = remainingDuration.inMinutes;
        remainingSeconds = remainingDuration.inSeconds % 60;
        setState(() {});
      } else {
        timer.cancel();
        context.read<ExamCubit>().setTimesUp();
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsManager.alarmImage,
          width: 24.w,
          height: 30.h,
        ),
        Gap(4.w),
        Text(
          "$remainingMinutes:${(remainingSeconds).toString().padLeft(2, '0')}",
          style: TextStyles.font20GreenRegular,
        ),
      ],
    );
  }
}
