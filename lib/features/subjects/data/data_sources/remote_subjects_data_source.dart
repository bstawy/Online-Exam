import '../../../../core/networking/api_result.dart';
import '../models/exams_response_model.dart';
import '../models/subjects_response_model.dart';

abstract class RemoteSubjectsDataSource {
  Future<ApiResult<SubjectsResponseModel>> getAllSubjects();
  Future<ApiResult<ExamsResponseModel>> getAllExams(String subjectId);
}
