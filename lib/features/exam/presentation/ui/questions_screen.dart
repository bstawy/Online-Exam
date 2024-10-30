import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/font_weight_helper.dart';
import '../../../../core/utils/assets_manager.dart';
import '../cubit/exam_cubit.dart';
import 'widgets/question_item.dart';

class QuestionsScreen extends StatelessWidget {
  static const String routeName = '/questions';
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExamCubit>().getExamQuestions('670070a830a3c3c1944a9c63');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam'),
        titleTextStyle: TextStyle(
          color: ColorsManager.blue,
          fontSize: 20.sp,
          fontWeight: FontWeightHelper.medium,
        ),
        forceMaterialTransparency: true,
        actions: [
          Image.asset(
            AssetsManager.alarmImage,
            width: 24.w,
            height: 30.h,
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<ExamCubit, ExamState>(
            buildWhen: (previous, current) =>
                current is ExamLoaded || current is QuestionChanged,
            builder: (context, state) {
              return Text(
                  "Question ${context.watch<ExamCubit>().currentQuestion} of ${context.watch<ExamCubit>().questions.length}");
            },
          ),
          BlocBuilder<ExamCubit, ExamState>(
            buildWhen: (previous, current) => current is! QuestionChanged,
            builder: (context, state) {
              if (state is ExamLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ExamLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.questions.length,
                    itemBuilder: (context, index) {
                      return QuestionItem(state.questions[index]);
                    },
                  ),
                );
              } else if (state is ExamError) {
                return Center(
                  child: Text(state.error.message ?? ''),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
