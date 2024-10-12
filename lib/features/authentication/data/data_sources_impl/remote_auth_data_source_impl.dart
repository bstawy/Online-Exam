import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../apis_manager/auth_apis_manager.dart';
import '../data_sources/remote_auth_data_source.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/sign_up_request_model.dart';
import '../models/responses/login_response_model.dart';
import '../models/responses/sign_up_response_model.dart';

@Injectable(as: RemoteAuthDataSource)
class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final AuthApisManager _apiManager;

  @factoryMethod
  RemoteAuthDataSourceImpl(this._apiManager);

  @override
  Future<ApiResult<SignUpResponseModel?>> signUp(
      SignUpRequestBodyModel userData) async {
    return await executeApiCall(
      () {
        return _apiManager.register(userData);
      },
    );
  }

  @override
  Future<ApiResult<LoginResponseModel?>> login(
      LoginRequestBodyModel userData) async {
    return await executeApiCall(
      () {
        return _apiManager.login(userData);
      },
    );
  }

  @override
  Future<ApiResult<void>> forgetPassword(String email) async {
    return await executeApiCall(
      () {
        return _apiManager.forgetPassword({'email': email});
      },
    );
  }

  @override
  Future<ApiResult<void>> verifyResetCode(String pin) async {
    return await executeApiCall(
      () {
        return _apiManager.verifyResetCode({'resetCode': pin});
      },
    );
  }
}
