import 'package:online_exam/features/subjects/data/data_sources/remote_exams_data_source.dart';
import 'package:online_exam/features/subjects/data/models/exam_response_model.dart';

import '../apis_manager/exams_apis_manager.dart';

class RemoteExamsDataSourceImpl implements RemoteExamsDataSource {
  final ExamsApisManager _apisManager;
  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."; // Store securely

  RemoteExamsDataSourceImpl(this._apisManager);

  @override
  Future<List<ExamResponseModel>> getAllExams(String subjectId) async {
    return await _apisManager.getAllExams(subjectId, _token);
  }
}
