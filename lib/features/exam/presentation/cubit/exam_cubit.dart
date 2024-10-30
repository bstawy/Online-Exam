import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/errors/api_error_handler.dart';
import '../../../../core/networking/errors/api_error_model.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/use_cases/get_exam_questions.dart';

part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetExamQuestions _getExamQuestions;

  ExamCubit(this._getExamQuestions) : super(ExamInitial());

  int currentQuestion = 1;

  List<Question> questions = [];
  List<String> answers = [];

  Future<void> getExamQuestions(String examId) async {
    emit(ExamLoading());
    final response = await _getExamQuestions(examId);

    switch (response) {
      case Success():
        questions = response.data;
        emit(ExamLoaded(response.data));
      case Failure():
        emit(ExamError(ApiErrorHandler.handle(response.exception)));
    }
  }

  void nextQuestion() {
    currentQuestion++;
    emit(QuestionChanged(currentQuestion));
  }

  void previousQuestion() {
    currentQuestion--;
    emit(QuestionChanged(currentQuestion));
  }
}
