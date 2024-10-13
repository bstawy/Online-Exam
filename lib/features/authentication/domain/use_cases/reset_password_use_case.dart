import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../repos/auth_repo.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepo _authRepo;

  ResetPasswordUseCase(this._authRepo);

  Future<ApiResult<void>> call(String email, String password) async {
    return await _authRepo.resetPassword(email, password);
  }
}
