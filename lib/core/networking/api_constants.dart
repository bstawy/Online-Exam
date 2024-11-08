class ApiConstants {
  static const String baseUrl = "https://exam.elevateegy.com/api/v1/";
}

class EndPoints {
  static const String signUp = "auth/signup";
  static const String login = "auth/signin";
  static const String forgetPassword = "auth/forgotPassword";
  static const String verifyResetCode = "auth/verifyResetCode";
  static const String resetPassword = "auth/resetPassword";
  static const String getSubjects = "subjects";
  static const String getExams = "exams";
  static const String getExamQuestions = "questions";
  static const String submitExamAnswers = "questions/check";
}
