import '../../../../core/networking/api_result.dart';
import '../../data/models/requests/sign_up_request_model.dart';
import '../../data/models/responses/sign_up_response_model.dart';

abstract class AuthRepo {
  Future<ApiResult<SignUpResponseModel?>> signUp(
      SignUpRequestBodyModel userData);
}
