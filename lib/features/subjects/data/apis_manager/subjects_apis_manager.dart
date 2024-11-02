import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/exams_response_model.dart';
import '../models/subjects_response_model.dart';

part 'subjects_apis_manager.g.dart';

@lazySingleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SubjectsApisManager {
  @factoryMethod
  factory SubjectsApisManager(Dio dio) = _SubjectsApisManager;

  @GET(EndPoints.getSubjects)
  Future<SubjectsResponseModel> getAllSubjects(
    @Header('token') String token,
  );

  @GET(EndPoints.getExams)
  Future<ExamsResponseModel> getAllExams(
    @Query("subject") String subjectId,
    @Header("token") String token,
  );
}
