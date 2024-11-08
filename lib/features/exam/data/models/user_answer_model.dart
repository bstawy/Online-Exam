class UserAnswerModel {
  List<UserAnswerData>? userAnswers;
  String? time;

  UserAnswerModel({
    this.userAnswers,
    this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'answers': userAnswers?.map((e) => e.toJson()).toList(),
      'time': time,
    };
  }
}

class UserAnswerData {
  String? questionId;
  String? userAnswer;

  UserAnswerData({
    this.questionId,
    this.userAnswer,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'correct': userAnswer,
    };
  }
}
