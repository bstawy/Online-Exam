import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/entities/exam_entity.dart';
import '../../domain/entities/subject_entity.dart';
import '../../domain/repos/subjects_repo.dart';
import '../data_sources/remote_subjects_data_source.dart';

@Injectable(as: SubjectsRepo)
class SubjectsRepoImpl implements SubjectsRepo {
  final RemoteSubjectsDataSource _remoteDataSource;

  @factoryMethod
  SubjectsRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<Subject>>> getAllSubjects() async {
    final result = await _remoteDataSource.getAllSubjects();
    switch (result) {
      case Success():
        return Success<List<Subject>>(
          result.data.subjects.map((e) => e.toEntity()).toList(),
        );
      case Failure():
        return Failure(result.exception);
    }
  }

  @override
  Future<ApiResult<List<Exam>>> getAllExams(String subjectId) async {
    final result = await _remoteDataSource.getAllExams(subjectId);
    switch (result) {
      case Success():
        return Success<List<Exam>>(
          result.data.exams.map((e) => e.toEntity()).toList(),
        );
      case Failure():
        return Failure(result.exception);
    }
  }
}
