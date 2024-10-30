import 'package:online_exam/features/subjects/domain/entities/exam_entity.dart';
import 'package:online_exam/features/subjects/domain/repos/exams_repo.dart';

class GetAllExamsUseCase {
  final ExamsRepo _repo;

  GetAllExamsUseCase(this._repo);

  Future<List<Exam>> call(String subjectId) async {
    return await _repo.getAllExams(subjectId);
  }
}
