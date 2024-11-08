import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/font_weight_helper.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = '/result';
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var exam = ModalRoute.of(context)!.settings.arguments as Exam;
    // context.read<ExamCubit>().getExamQuestions(exam.id);
    // .getExamQuestions('670070a830a3c3c1944a9c63');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Score'),
        titleTextStyle: TextStyle(
          color: ColorsManager.black,
          fontSize: 20.sp,
          fontWeight: FontWeightHelper.medium,
        ),
        forceMaterialTransparency: true,
      ),
      body: const Center(
        child: Text('Your score is 80%'),
      ),
    );
  }
}
