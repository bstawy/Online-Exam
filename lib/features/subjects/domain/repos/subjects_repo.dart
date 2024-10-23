import '../../../../core/networking/api_result.dart';
import '../entities/subject_entity.dart';

abstract class SubjectsRepo {
  Future<ApiResult<List<Subject>>> getAllSubjects();
}
