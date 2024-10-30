import '../../../subjects/domain/entities/subject_entity.dart';
import 'answer_entity.dart';

class Question {
  List<Answer>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  Subject? subject;
  ExamEntity? exam;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
  });
}

class ExamEntity {
  String? id;
  String? title;
  int? duration;
  Subject? subject;
  int? numberOfQuestions;
  bool? isActive;

  ExamEntity({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.isActive,
  });
}
