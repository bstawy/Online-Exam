import 'package:online_exam/features/authentication/login/data/datasources/auth_api_service.dart';

import '../models/sign_in_request.dart';
import '../models/sign_in_response.dart';

abstract class AuthRemoteDataSource {
  Future<SignInResponse> signIn(SignInRequest request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<SignInResponse> signIn(SignInRequest request) {
    return _apiService.signIn(request);
  }
}
