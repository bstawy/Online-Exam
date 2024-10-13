import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/repos/auth_repo.dart';
import '../data_sources/remote_auth_data_source.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/sign_up_request_model.dart';
import '../models/responses/login_response_model.dart';
import '../models/responses/sign_up_response_model.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final RemoteAuthDataSource _remoteDataSource;

  @factoryMethod
  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<SignUpResponseModel?>> signUp(
      SignUpRequestBodyModel userData) async {
    return await _remoteDataSource.signUp(userData);
  }

  @override
  Future<ApiResult<LoginResponseModel?>> login(
      LoginRequestBodyModel userData) async {
    return await _remoteDataSource.login(userData);
  }

  @override
  Future<ApiResult<void>> forgetPassword(String email) async {
    return await _remoteDataSource.forgetPassword(email);
  }

  @override
  Future<ApiResult<void>> verifyResetCode(String pin) async {
    return await _remoteDataSource.verifyResetCode(pin);
  }

  @override
  Future<ApiResult<void>> resetPassword(String email, String password) async {
    return await _remoteDataSource.resetPassword(email, password);
  }
}
