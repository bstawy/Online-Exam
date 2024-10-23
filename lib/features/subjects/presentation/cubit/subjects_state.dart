part of 'subjects_cubit.dart';

sealed class SubjectsState {}

final class SubjectsInitial extends SubjectsState {}

final class SubjectsLoading extends SubjectsState {}

final class SubjectsLoaded extends SubjectsState {
  final List<Subject> subjects;

  SubjectsLoaded(this.subjects);
}

final class SubjectsError extends SubjectsState {
  final ApiErrorModel errorModel;

  SubjectsError(this.errorModel);
}
