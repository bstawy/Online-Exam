import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../repos/auth_repo.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepo _repo;

  ForgetPasswordUseCase(this._repo);

  Future<ApiResult<void>> call(String email) async {
    return await _repo.forgetPassword(email);
  }
}
