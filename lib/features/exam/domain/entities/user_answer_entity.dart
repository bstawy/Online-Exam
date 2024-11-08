import '../../data/models/user_answer_model.dart';

class UserExamAnswer {
  List<UserAnswer>? userAnswers;
  String? time;

  UserExamAnswer({
    this.userAnswers,
    this.time,
  });

  UserAnswerModel toModel() {
    return UserAnswerModel(
      userAnswers: userAnswers?.map((e) => e.toModel()).toList(),
      time: time,
    );
  }
}

class UserAnswer {
  String? questionId;
  String? answerKey;

  UserAnswer({
    this.questionId,
    this.answerKey,
  });

  UserAnswerData toModel() {
    return UserAnswerData(
      questionId: questionId.toString(),
      userAnswer: answerKey.toString(),
    );
  }
}
