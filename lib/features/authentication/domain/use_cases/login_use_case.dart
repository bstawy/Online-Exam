import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/requests/login_request_model.dart';
import '../../data/models/responses/login_response_model.dart';
import '../repos/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo _repository;

  LoginUseCase(this._repository);

  Future<ApiResult<LoginResponseModel?>> call(
      LoginRequestBodyModel userData) async {
    return await _repository.login(userData);
  }
}
