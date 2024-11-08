import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/exam_questions_response_model.dart';
import '../models/submit_answers_response.dart';
import '../models/user_answer_model.dart';

part 'exam_apis_manager.g.dart';

@lazySingleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ExamApisManager {
  @factoryMethod
  factory ExamApisManager(Dio dio) = _ExamApisManager;

  @GET(EndPoints.getExamQuestions)
  Future<ExamQuestionsResponseModel> getExamQuestions(
    @Header('token') String token,
    @Query('exam') String examId,
  );
  @POST(EndPoints.submitExamAnswers)
  Future<SubmitAnswersResponseModel> submitExamAnswers(
    @Header('token') String token,
    @Body() UserAnswerModel answers,
  );
}
