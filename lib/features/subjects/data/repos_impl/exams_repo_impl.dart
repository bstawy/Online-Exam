import 'package:online_exam/features/subjects/domain/repos/exams_repo.dart';

import '../../domain/entities/exam_entity.dart';
import '../data_sources/remote_exams_data_source.dart';

class ExamsRepoImpl implements ExamsRepo {
  final RemoteExamsDataSource _remoteDataSource;

  ExamsRepoImpl(this._remoteDataSource);

  @override
  Future<List<Exam>> getAllExams(String subjectId) async {
    final examModels = await _remoteDataSource.getAllExams(subjectId);
    return examModels.map((model) => model.toEntity()).toList();
  }
}
