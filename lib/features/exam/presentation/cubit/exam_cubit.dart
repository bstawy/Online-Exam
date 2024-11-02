import 'dart:developer';

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

  int currentQuestion = 0;
  String selectedAnswerKey = '';
  bool timesUp = false;

  List<Question> questions = [];
  Map<String, String> answers = {};

  Future<void> getExamQuestions(String examId) async {
    emit(ExamLoading());
    final response = await _getExamQuestions(examId);

    switch (response) {
      case Success():
        questions = response.data;
        log('Questions: ${questions.map((e) => e.toMap())}');
        emit(ExamLoaded(response.data));
      case Failure():
        emit(ExamError(ApiErrorHandler.handle(response.exception)));
    }
  }

  void selectAnswer(String key) {
    selectedAnswerKey = key;
    log('Selected answer: $key');
    log('Current question: ${questions[currentQuestion].id}');
    answers[questions[currentQuestion].id!] = key;
    emit(AnswerSelected(key));
  }

  void setTimesUp() {
    timesUp = true;
    emit(QuizTimesUp());
  }

  String getAnswerForKey(String? key) {
    if (key == null) return '';
    return answers[key] ?? '';
  }

  void nextQuestion() {
    currentQuestion++;
    selectedAnswerKey = getAnswerForKey(questions[currentQuestion].id);
    emit(QuestionChanged(currentQuestion));
  }

  void previousQuestion() {
    currentQuestion--;
    selectedAnswerKey = getAnswerForKey(questions[currentQuestion].id);
    emit(QuestionChanged(currentQuestion));
  }
}
