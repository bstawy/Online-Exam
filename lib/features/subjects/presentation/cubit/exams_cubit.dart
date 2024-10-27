import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/subjects/presentation/cubit/exams_state.dart';

import '../../domain/use_cases/get_all_exams_use_case.dart';

class ExamsCubit extends Cubit<ExamsState> {
  final GetAllExamsUseCase _getAllExamsUseCase;

  ExamsCubit(this._getAllExamsUseCase) : super(ExamsInitial());

  Future<void> getAllExams(String subjectId) async {
    emit(ExamsLoading());
    try {
      final exams = await _getAllExamsUseCase(subjectId);
      emit(ExamsLoaded(exams));
    } catch (e) {
      emit(ExamsError(e.toString()));
    }
  }
}
