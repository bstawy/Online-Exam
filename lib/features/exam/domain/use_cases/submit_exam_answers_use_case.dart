import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../entities/user_answer_entity.dart';
import '../repos/exam_repo.dart';

@injectable
class SubmitExamAnswersUseCase {
  final ExamRepo _examRepository;

  SubmitExamAnswersUseCase(this._examRepository);

  Future<ApiResult<void>> call(UserExamAnswer answers) async {
    return await _examRepository.submitExamAnswers(answers);
  }
}
