import 'package:equatable/equatable.dart';

import '../../domain/entities/exam_entity.dart';

abstract class ExamsState extends Equatable {
  const ExamsState();

  @override
  List<Object?> get props => [];
}

class ExamsInitial extends ExamsState {}

class ExamsLoading extends ExamsState {}

class ExamsLoaded extends ExamsState {
  final List<Exam> exams;

  const ExamsLoaded(this.exams);

  @override
  List<Object?> get props => [exams];
}

class ExamsError extends ExamsState {
  final String message;

  const ExamsError(this.message);

  @override
  List<Object?> get props => [message];
}
