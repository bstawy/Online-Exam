import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/service_locator/service_locator.dart';
import '../../../../../domain/entities/subject_entity.dart';
import '../../../../cubit/exams_cubit.dart';
import '../../../../cubit/exams_state.dart';
import 'widgets/exam_list_item.dart';

class ExamsPage extends StatelessWidget {
  static const String routeName = '/exams';
  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Subject subject =
        ModalRoute.of(context)?.settings.arguments as Subject;

    return BlocProvider(
      create: (context) => getIt<ExamsCubit>()..getAllExams(subject.id),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(subject.name ?? ''),
        ),
        body: BlocBuilder<ExamsCubit, ExamsState>(
          builder: (context, state) {
            if (state is ExamsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExamsLoaded) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: state.exams.length,
                itemBuilder: (context, index) {
                  return ExamListItem(exam: state.exams[index]);
                },
              );
            } else if (state is ExamsError) {
              return Center(child: Text(state.error.message ?? ''));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
