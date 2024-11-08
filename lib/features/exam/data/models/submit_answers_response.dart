class QuestionResult {
  String? qID;
  String? question;
  String? correctAnswer;
  String? inCorrectAnswer;

  QuestionResult({
    this.qID,
    this.question,
    this.correctAnswer,
    this.inCorrectAnswer,
  });

  QuestionResult.fromJson(Map<String, dynamic> json) {
    qID = json['QID'];
    question = json['Question'];
    correctAnswer = json['correctAnswer'];
    inCorrectAnswer = json['inCorrectAnswer'];
  }
}

class SubmitAnswersResponseModel {
  String? message;
  int? correct;
  int? wrong;
  String? total;
  List<QuestionResult>? wrongQuestions;
  List<QuestionResult>? correctQuestions;

  SubmitAnswersResponseModel({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  factory SubmitAnswersResponseModel.fromJson(Map<String, dynamic> json) {
    return SubmitAnswersResponseModel(
      message: json['message'],
      correct: json['correct'],
      wrong: json['wrong'],
      total: json['total'],
      wrongQuestions: json['WrongQuestions'] != null
          ? List<QuestionResult>.from(
              json['WrongQuestions'].map((x) => QuestionResult.fromJson(x)))
          : null,
      correctQuestions: json['correctQuestions'] != null
          ? List<QuestionResult>.from(
              json['correctQuestions'].map((x) => QuestionResult.fromJson(x)))
          : null,
    );
  }
}
