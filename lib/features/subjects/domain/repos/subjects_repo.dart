import '../../../../core/networking/api_result.dart';
import '../entities/exam_entity.dart';
import '../entities/subject_entity.dart';

abstract class SubjectsRepo {
  Future<ApiResult<List<Subject>>> getAllSubjects();
  Future<ApiResult<List<Exam>>> getAllExams(String subjectId);
}
