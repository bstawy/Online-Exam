import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/navigation_ext.dart';
import '../../../../../core/utils/times_up_dialog.dart';
import '../../cubit/exam_cubit.dart';

class TimesUpListener extends StatelessWidget {
  const TimesUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamCubit, ExamState>(
      listener: (context, state) {
        if (state is QuizTimesUp) {
          showTimesUpDialog(() {
            context.pop();
            context.read<ExamCubit>().submitAnswers();
          });
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
