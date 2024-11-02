import '../../../exam/domain/entities/question_entity.dart';
import '../../../subjects/data/models/exams_response_model.dart';
import '../../../subjects/data/models/subjects_response_model.dart';
import 'answer_model.dart';

class QuestionDataModel {
  List<AnswerModel>? answers;
  String? type;
  String? id;
  String? question;
  String? correctAnswerKey;
  SubjectDataModel? subject;
  ExamDataModel? exam;

  QuestionDataModel({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correctAnswerKey,
    this.subject,
    this.exam,
  });

  QuestionDataModel.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <AnswerModel>[];
      json['answers'].forEach((v) {
        answers!.add(AnswerModel.fromJson(v));
      });
    }
    type = json['type'];
    id = json['_id'];
    question = json['question'];
    correctAnswerKey = json['correct'];
    subject = json['subject'] != null
        ? SubjectDataModel.fromJson(json['subject'])
        : null;
    exam = json['exam'] != null ? ExamDataModel.fromJson(json['exam']) : null;
  }

  Question toEntity() {
    return Question(
      answers: answers?.map((e) => e.toEntity()).toList(),
      type: type,
      id: id,
      question: question,
      correct: correctAnswerKey,
      subject: subject?.toEntity(),
      exam: exam?.toEntity(),
    );
  }
}
