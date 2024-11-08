import 'package:injectable/injectable.dart';

import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../../../exam/data/apis_manager/exam_apis_manager.dart';
import '../../../exam/data/data_sources/remote_questions_data_source.dart';
import '../../../exam/data/models/exam_questions_response_model.dart';
import '../models/user_answer_model.dart';

@Injectable(as: RemoteQuestionsDataSource)
class RemoteQuestionsDataSourceImpl implements RemoteQuestionsDataSource {
  final ExamApisManager _examApisManager;

  RemoteQuestionsDataSourceImpl(this._examApisManager);

  @override
  Future<ApiResult<ExamQuestionsResponseModel>> getExamQuestions(
      String examId) async {
    final token = await TokensManager.getToken();
    return await executeApiCall(() {
      return _examApisManager.getExamQuestions(token ?? '', examId);
    });
  }

  @override
  Future<ApiResult<void>> submitExamAnswers(UserAnswerModel answers) async {
    final token = await TokensManager.getToken();
    return await executeApiCall(() {
      return _examApisManager.submitExamAnswers(token ?? '', answers);
    });
  }
}
