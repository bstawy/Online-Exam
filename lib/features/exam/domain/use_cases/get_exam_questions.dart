import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../entities/question_entity.dart';
import '../repos/exam_repo.dart';

@injectable
class GetExamQuestions {
  final ExamRepo _examsRepo;

  GetExamQuestions(this._examsRepo);

  Future<ApiResult<List<Question>>> call(String examId) async {
    return await _examsRepo.getExamQuestions(examId);
  }
}
