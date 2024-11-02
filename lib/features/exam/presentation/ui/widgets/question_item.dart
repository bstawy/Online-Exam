import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/text_styles.dart';
import '../../../domain/entities/question_entity.dart';
import '../../cubit/exam_cubit.dart';
import 'answer_item.dart';

class QuestionItem extends StatelessWidget {
  final Question question;

  const QuestionItem(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question ?? '',
          style: TextStyles.font18BlackMedium,
        ),
        Gap(16.h),
        ...question.answers!.map((answer) {
          return BlocBuilder<ExamCubit, ExamState>(
            builder: (context, state) {
              return AnswerItem(answer: answer);
            },
          );
        }),
      ],
    );
  }
}
