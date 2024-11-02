import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../entities/exam_entity.dart';
import '../repos/subjects_repo.dart';

@injectable
class GetAllExamsUseCase {
  final SubjectsRepo _repo;

  GetAllExamsUseCase(this._repo);

  Future<ApiResult<List<Exam>>> call(String subjectId) async {
    return await _repo.getAllExams(subjectId);
  }
}
