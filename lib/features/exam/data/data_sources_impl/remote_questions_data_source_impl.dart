import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../../../exam/data/apis_manager/exam_apis_manager.dart';
import '../../../exam/data/data_sources/remote_questions_data_source.dart';
import '../../../exam/data/models/exam_questions_response_model.dart';

@Injectable(as: RemoteQuestionsDataSource)
class RemoteQuestionsDataSourceImpl implements RemoteQuestionsDataSource {
  final ExamApisManager _examApisManager;

  RemoteQuestionsDataSourceImpl(this._examApisManager);

  @override
  Future<ApiResult<ExamQuestionsResponseModel>> getExamQuestions(
      String token, String examId) async {
    return await executeApiCall(() {
      return _examApisManager.getExamQuestions(token, examId);
    });
  }
}
