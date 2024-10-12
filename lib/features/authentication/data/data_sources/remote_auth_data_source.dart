import '../../../../core/networking/api_result.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/sign_up_request_model.dart';
import '../models/responses/login_response_model.dart';
import '../models/responses/sign_up_response_model.dart';

abstract class RemoteAuthDataSource {
  Future<ApiResult<SignUpResponseModel?>> signUp(
      SignUpRequestBodyModel userData);

  Future<ApiResult<LoginResponseModel?>> login(LoginRequestBodyModel userData);

  Future<ApiResult<void>> forgetPassword(String email);
}
