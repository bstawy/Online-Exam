import 'question_data_model.dart';

class ExamQuestionsResponseModel {
  String? message;
  List<QuestionDataModel>? questions;

  ExamQuestionsResponseModel({this.message, this.questions});

  factory ExamQuestionsResponseModel.fromJson(Map<String, dynamic> json) {
    return ExamQuestionsResponseModel(
      message: json['message'],
      questions: json['questions'] != null
          ? (json['questions'] as List)
              .map((i) => QuestionDataModel.fromJson(i))
              .toList()
          : null,
    );
  }
}
