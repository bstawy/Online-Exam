import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/font_weight_helper.dart';
import '../../../subjects/domain/entities/exam_entity.dart';
import '../cubit/exam_cubit.dart';
import 'widgets/questions_list.dart';
import 'widgets/quiz_duration_widget.dart';
import 'widgets/times_up_listener.dart';

class QuestionsScreen extends StatelessWidget {
  static const String routeName = '/questions';
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var exam = ModalRoute.of(context)!.settings.arguments as Exam;
    context.read<ExamCubit>().getExamQuestions(exam.id);
    // .getExamQuestions('670070a830a3c3c1944a9c63');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam'),
        titleTextStyle: TextStyle(
          color: ColorsManager.black,
          fontSize: 20.sp,
          fontWeight: FontWeightHelper.medium,
        ),
        forceMaterialTransparency: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: const QuizDuration(
              duration: 1,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const TimesUpListener(),
          Gap(4.h),
          BlocBuilder<ExamCubit, ExamState>(
            builder: (context, state) {
              if (state is ExamLoading) {
                return SizedBox(
                  width: 1.sw,
                  height: 0.7.sh,
                  child: Center(
                    child: SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                );
              } else if (state is ExamError) {
                return Center(
                  child: Text(state.error.message ?? ''),
                );
              } else {
                return QuestionsList(
                  questions: context.read<ExamCubit>().questions,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
