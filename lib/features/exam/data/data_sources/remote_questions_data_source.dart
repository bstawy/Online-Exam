import '../../../../core/networking/api_result.dart';
import '../../../exam/data/models/exam_questions_response_model.dart';

abstract class RemoteQuestionsDataSource {
  Future<ApiResult<ExamQuestionsResponseModel>> getExamQuestions(
    String token,
    String examId,
  );
}
