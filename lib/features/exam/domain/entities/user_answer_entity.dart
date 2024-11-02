class UserAnswerEntity {
  int? questionId;
  int? answerKey;

  UserAnswerEntity({
    this.questionId,
    this.answerKey,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'answerId': answerKey,
    };
  }

  factory UserAnswerEntity.fromJson(Map<String, dynamic> map) {
    return UserAnswerEntity(
      questionId: map['questionId'],
      answerKey: map['answerId'],
    );
  }
}
