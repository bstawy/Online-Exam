import '../../../../core/networking/api_result.dart';
import '../models/subjects_response_model.dart';

abstract class RemoteSubjectsDataSource {
  Future<ApiResult<SubjectsResponseModel>> getAllSubjects(String token);
}
