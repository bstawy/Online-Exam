part of 'result_cubit.dart';

sealed class ResultState {}

final class ResultInitial extends ResultState {}

final class AnswerSubmitting extends ResultState {}

final class AnswerSubmitted extends ResultState {}

final class AnswerSubmitError extends ResultState {
  final ApiErrorModel error;

  AnswerSubmitError(this.error);
}
