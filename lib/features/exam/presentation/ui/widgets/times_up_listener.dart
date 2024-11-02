import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/exam_cubit.dart';
import '../times_up_screen.dart';

class TimesUpListener extends StatelessWidget {
  const TimesUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamCubit, ExamState>(
      listener: (context, state) {
        if (state is QuizTimesUp) {
          Navigator.of(context).pushReplacementNamed(TimesUpScreen.routeName);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
