import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/exam_response_model.dart';

part 'exams_apis_manager.g.dart';

@RestApi(baseUrl: "https://exam.elevateegy.com/api/v1/")
abstract class ExamsApisManager {
  factory ExamsApisManager(Dio dio) = _ExamsApisManager;

  @GET("exams")
  Future<List<ExamResponseModel>> getAllExams(
    @Query("subject") String subjectId,
    @Header("token") String token,
  );
}
