import '../entities/exam_entity.dart';

abstract class ExamsRepo {
  Future<List<Exam>> getAllExams(String subjectId);
}
