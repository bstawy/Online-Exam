import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/errors/api_error_handler.dart';
import '../../../../core/networking/errors/api_error_model.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/entities/user_answer_entity.dart';
import '../../domain/use_cases/get_exam_questions.dart';
import '../../domain/use_cases/submit_exam_answers_use_case.dart';

part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetExamQuestions _getExamQuestions;
  final SubmitExamAnswersUseCase _submitExamAnswersUseCase;

  ExamCubit(this._getExamQuestions, this._submitExamAnswersUseCase)
      : super(ExamInitial());

  int currentQuestion = 0;
  String selectedAnswerKey = '';
  bool timesUp = false;

  List<Question> questions = [];
  List<UserAnswer> answers = [];

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

  Future<void> submitAnswers() async {
    log(answers.length.toString(), name: 'Answers');
    emit(ExamSubmitting());

    UserExamAnswer userAnswer = UserExamAnswer(
      userAnswers: answers,
      time: '10',
    );

    final response = await _submitExamAnswersUseCase.call(userAnswer);

    switch (response) {
      case Success():
        emit(ExamSubmitted());
      case Failure():
        emit(ExamSubmitError(ApiErrorHandler.handle(response.exception)));
    }
  }

  void selectAnswer(String key) {
    selectedAnswerKey = key;
    log('Selected answer: $key');
    log('Current question: ${questions[currentQuestion].id}');

    bool answerExists = false;
    for (var answer in answers) {
      if (answer.questionId == questions[currentQuestion].id) {
        answer.answerKey = key;
        answerExists = true;
        break;
      }
    }
    if (!answerExists) {
      answers.add(UserAnswer(
          questionId: questions[currentQuestion].id, answerKey: key));
    } else {
      log('Answer exists');
      for (var answer in answers) {
        if (answer.questionId == questions[currentQuestion].id) {
          if (answer.answerKey != key) {
            answer.answerKey = key;
          }
          break;
        }
      }
    }

    // answers.map((e) {
    //   if (e.questionId == questions[currentQuestion].id) {
    //     if (e.answerKey != key) {
    //       e.answerKey = key;
    //     }
    //   } else {
    //     answers.add(UserAnswer(
    //         questionId: questions[currentQuestion].id, answerKey: key));
    //   }
    //   return;
    // }).toList();

    emit(AnswerSelected(key));
  }

  void setTimesUp() {
    timesUp = true;
    emit(QuizTimesUp());
  }

  String getAnswerForQuestion(String? id) {
    String answer = '';

    if (id == null) return '';
    answers.map((e) {
      if (e.questionId == id) {
        answer = e.answerKey ?? '';
      }
      return;
    }).toList();

    return answer;
  }

  void nextQuestion() {
    currentQuestion++;
    selectedAnswerKey = '';
    // selectedAnswerKey = getAnswerForKey(questions[currentQuestion].id);
    emit(QuestionChanged(currentQuestion));
  }

  void previousQuestion() {
    currentQuestion--;
    selectedAnswerKey = getAnswerForQuestion(questions[currentQuestion].id);
    emit(QuestionChanged(currentQuestion));
  }
}
