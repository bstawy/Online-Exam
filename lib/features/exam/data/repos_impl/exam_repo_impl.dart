import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../exam/domain/entities/question_entity.dart';
import '../../../exam/domain/repos/exam_repo.dart';
import '../../domain/entities/user_answer_entity.dart';
import '../data_sources/remote_questions_data_source.dart';
import '../models/user_answer_model.dart';

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

  @override
  Future<ApiResult<void>> submitExamAnswers(UserExamAnswer answers) async {
    final UserAnswerModel allAnswers = answers.toModel();

    final result =
        await _remoteQuestionsDataSource.submitExamAnswers(allAnswers);

    switch (result) {
      case Success():
        return Success(null);
      case Failure():
        return Failure(result.exception);
    }
  }
}
