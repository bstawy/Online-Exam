import '../../../../core/networking/api_result.dart';
import '../../../exam/data/models/exam_questions_response_model.dart';
import '../models/user_answer_model.dart';

abstract class RemoteQuestionsDataSource {
  Future<ApiResult<ExamQuestionsResponseModel>> getExamQuestions(String examId);
  Future<ApiResult<void>> submitExamAnswers(UserAnswerModel answers);
}
