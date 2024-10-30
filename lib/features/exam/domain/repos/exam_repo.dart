import '../../../../core/networking/api_result.dart';
import '../entities/question_entity.dart';

abstract class ExamRepo {
  Future<ApiResult<List<Question>>> getExamQuestions(String examId);
}
