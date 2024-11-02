import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../exam/domain/entities/question_entity.dart';
import '../../../exam/domain/repos/exam_repo.dart';
import '../data_sources/remote_questions_data_source.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final RemoteQuestionsDataSource _remoteQuestionsDataSource;

  ExamRepoImpl(this._remoteQuestionsDataSource);

  @override
  Future<ApiResult<List<Question>>> getExamQuestions(String examId) async {
    final result = await _remoteQuestionsDataSource.getExamQuestions(examId);

    switch (result) {
      case Success():
        final questions =
            result.data.questions?.map((e) => e.toEntity()).toList();
        return Success(questions ?? []);
      case Failure():
        return Failure(result.exception);
    }
  }
}
