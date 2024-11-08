import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors_manager.dart';
import '../../../domain/entities/answer_entity.dart';
import '../../cubit/exam_cubit.dart';

class AnswerItem extends StatelessWidget {
  final Answer answer;

  const AnswerItem({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      //  padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 8.h),
      decoration: BoxDecoration(
        color: context.read<ExamCubit>().selectedAnswerKey == answer.key
            ? ColorsManager.darkBlue
            : ColorsManager.lighterBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: RadioListTile<String>(
        title: Text(answer.answer ?? ''),
        value: answer.key ?? '',
        groupValue: context.read<ExamCubit>().selectedAnswerKey,
        splashRadius: 10.r,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        onChanged: (value) {
          context.read<ExamCubit>().selectAnswer(value!);
        },
      ),
    );
  }
}
