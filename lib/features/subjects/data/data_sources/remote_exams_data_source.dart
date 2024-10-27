import 'package:online_exam/features/subjects/data/models/exam_response_model.dart';

abstract class RemoteExamsDataSource {
  Future<List<ExamResponseModel>> getAllExams(String subjectId);
}
