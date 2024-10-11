import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/requests/sign_up_request_model.dart';
import '../../data/models/responses/sign_up_response_model.dart';
import '../repos/auth_repo.dart';

@injectable
class SignUpUseCase {
  final AuthRepo _repo;

  SignUpUseCase(this._repo);

  Future<ApiResult<SignUpResponseModel?>> call(
      SignUpRequestBodyModel userData) async {
    return await _repo.signUp(userData);
  }
}
