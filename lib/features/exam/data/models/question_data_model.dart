import '../../../exam/domain/entities/question_entity.dart';
import '../../../subjects/data/models/subjects_response_model.dart';
import 'answer_model.dart';

class QuestionDataModel {
  List<AnswerModel>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  SubjectDataModel? subject;
  ExamDataModel? exam;

  QuestionDataModel({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
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
    id = json['id'];
    question = json['question'];
    correct = json['correct'];
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
      correct: correct,
      subject: subject?.toEntity(),
      exam: exam?.toEntity(),
    );
  }
}

class ExamDataModel {
  String? id;
  String? title;
  int? duration;
  SubjectDataModel? subject;
  int? numberOfQuestions;
  bool? isActive;

  ExamDataModel({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.isActive,
  });

  ExamDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'] != null
        ? SubjectDataModel.fromJson(json['subject'])
        : null;
    numberOfQuestions = json['numberOfQuestions'];
    isActive = json['isActive'];
  }

  ExamEntity toEntity() {
    return ExamEntity(
      id: id,
      title: title,
      duration: duration,
      subject: subject!.toEntity(),
      numberOfQuestions: numberOfQuestions,
      isActive: isActive,
    );
  }
}
