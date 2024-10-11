import 'package:dartz/dartz.dart';
import 'package:online_exam/features/authentication/login/domain/repositories/auth_repository.dart';

import '../../../../../core/error/failures_dart.dart';

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  Future<Either<Failure, String>> call(String email, String password) {
    return _repository.signIn(email, password);
  }
}
