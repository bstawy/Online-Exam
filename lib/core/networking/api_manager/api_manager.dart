import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../features/authentication/data/models/requests/sign_up_request_model.dart';
import '../../../features/authentication/data/models/responses/sign_up_response_model.dart';
import '../api_constants.dart';

part 'api_manager.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(EndPoints.signUp)
  Future<SignUpResponseModel> register(
    @Body() SignUpRequestBodyModel signUpRequestBody,
  );
}
