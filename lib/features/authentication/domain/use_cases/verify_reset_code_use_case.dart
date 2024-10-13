import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../repos/auth_repo.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepo _repo;

  VerifyResetCodeUseCase(this._repo);

  Future<ApiResult<void>> call(String pin) async {
    return _repo.verifyResetCode(pin);
  }
}
