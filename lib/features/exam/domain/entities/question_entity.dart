import '../../../subjects/domain/entities/exam_entity.dart';
import '../../../subjects/domain/entities/subject_entity.dart';
import 'answer_entity.dart';

class Question {
  List<Answer>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  Subject? subject;
  Exam? exam;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
      'question': question,
      'correct': correct,
    };
  }
}
