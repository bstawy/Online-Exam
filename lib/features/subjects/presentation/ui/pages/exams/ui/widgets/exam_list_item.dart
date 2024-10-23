import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_exam/core/utils/assets_manager.dart';

import '../../../../../../../../core/theme/colors_manager.dart';
import '../../../../../../../../core/theme/text_styles.dart';
import '../../../../../../domain/entities/exam_entity.dart';

class ExamListItem extends StatelessWidget {
  final Exam exam;

  const ExamListItem({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManager.lightWhite,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff2a2929).withOpacity(0.25),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: ColorsManager.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(AssetsManager.examIcon),
          ),
          Gap(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.level,
                  style: TextStyles.font16BlackRegular,
                ),
                Text(
                  '${exam.questionCount} Question',
                  style: TextStyles.font14GreyMedium,
                ),
                Gap(4.h),
                Text(
                  'From: ${exam.fromTime.toStringAsFixed(2)}   To: ${exam.toTime.toStringAsFixed(2)}',
                  style: TextStyles.font14GreyMedium,
                ),
              ],
            ),
          ),
          Text(
            '${exam.durationMinutes} Minutes',
            style: TextStyle(
              color: ColorsManager.blue,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
