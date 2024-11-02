import '../../../../core/networking/errors/api_error_model.dart';
import '../../domain/entities/exam_entity.dart';

abstract class ExamsState {}

class ExamsInitial extends ExamsState {}

class ExamsLoading extends ExamsState {}

class ExamsLoaded extends ExamsState {
  final List<Exam> exams;

  ExamsLoaded(this.exams);
}

class ExamsError extends ExamsState {
  final ApiErrorModel error;

  ExamsError(this.error);
}
