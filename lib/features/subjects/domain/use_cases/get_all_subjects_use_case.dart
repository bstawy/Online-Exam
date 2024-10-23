import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../entities/subject_entity.dart';
import '../repos/subjects_repo.dart';

@injectable
class GetAllSubjectsUseCase {
  final SubjectsRepo _repo;

  GetAllSubjectsUseCase(this._repo);

  Future<ApiResult<List<Subject>>> call() async {
    return await _repo.getAllSubjects();
  }
}
