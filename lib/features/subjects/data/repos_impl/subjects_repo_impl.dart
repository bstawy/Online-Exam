import 'package:injectable/injectable.dart';

import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/networking/api_result.dart';
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
    final token = await TokensManager.getToken();

    final result = await _remoteDataSource.getAllSubjects(token ?? '');
    switch (result) {
      case Success():
        return Success<List<Subject>>(
          result.data.subjects?.map((e) => e.toEntity()).toList() ?? [],
        );
      case Failure():
        return Failure(result.exception);
    }
  }
}
