import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/sign_up_request_model.dart';
import '../models/responses/login_response_model.dart';
import '../models/responses/sign_up_response_model.dart';

part 'auth_apis_manager.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApisManager {
  @factoryMethod
  factory AuthApisManager(Dio dio) = _AuthApisManager;

  @POST(EndPoints.signUp)
  Future<SignUpResponseModel> register(
    @Body() SignUpRequestBodyModel signUpRequestBody,
  );

  @POST(EndPoints.login)
  Future<LoginResponseModel> login(
    @Body() LoginRequestBodyModel loginRequestBody,
  );

  @POST(EndPoints.forgetPassword)
  Future<void> forgetPassword(
    @Body() Map<String, dynamic> email,
  );
}
