import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/service_locator/service_locator.dart';
import 'package:online_exam/features/subjects/domain/entities/subject_entity.dart';
import 'package:online_exam/features/subjects/presentation/cubit/exams_cubit.dart';
import 'package:online_exam/features/subjects/presentation/cubit/exams_state.dart';
import 'package:online_exam/features/subjects/presentation/ui/pages/exams/ui/widgets/exam_list_item.dart';

class ExamsPage extends StatelessWidget {
  final Subject subject;

  const ExamsPage({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
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
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}