part of 'exam_cubit.dart';

sealed class ExamState {}

final class ExamInitial extends ExamState {}

final class ExamLoading extends ExamState {}

final class ExamLoaded extends ExamState {
  final List<Question> questions;

  ExamLoaded(this.questions);
}

final class ExamError extends ExamState {
  final ApiErrorModel error;

  ExamError(this.error);
}

final class QuestionChanged extends ExamState {
  final int currentQuestion;

  QuestionChanged(this.currentQuestion);
}

final class QuizTimesUp extends ExamState {}

final class AnswerSelected extends ExamState {
  final String selectedAnswer;

  AnswerSelected(this.selectedAnswer);
}
