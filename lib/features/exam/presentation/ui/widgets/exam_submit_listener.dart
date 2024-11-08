import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/navigation_ext.dart';
import '../../../../../core/utils/error_dialog.dart';
import '../../../../../core/utils/loading_dialog.dart';
import '../../../../result/presentation/ui/result_screen.dart';
import '../../cubit/exam_cubit.dart';

class ExamSubmitListener extends StatelessWidget {
  const ExamSubmitListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamCubit, ExamState>(
      listenWhen: (previous, current) {
        if (previous is ExamSubmitting && current is! ExamSubmitting) {
          context.pop();
        }
        if (current is ExamSubmitting ||
            current is ExamSubmitted ||
            current is ExamSubmitError) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is ExamSubmitting) {
          showLoadingDialog();
        } else if (state is ExamSubmitted) {
          Navigator.of(context).pushReplacementNamed(ResultScreen.routeName);
          // showSuccessDialog(
          //   msg: 'Exam submitted successfully',
          //   whenAnimationFinished: () {

          //   },
          // );
        } else if (state is ExamSubmitError) {
          showErrorDialog(state.error.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
