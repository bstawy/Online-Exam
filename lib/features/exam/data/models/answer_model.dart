import '../../../exam/domain/entities/answer_entity.dart';

class AnswerModel {
  String? answer;
  String? key;

  AnswerModel({this.answer, this.key});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    key = json['key'];
  }

  Answer toEntity() {
    return Answer(answer: answer, key: key);
  }
}
