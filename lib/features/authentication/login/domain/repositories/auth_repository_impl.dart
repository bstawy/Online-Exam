import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_exam/features/authentication/login/data/datasources/auth-remote-data-source.dart';

import '../../../../../core/error/failures_dart.dart';

import '../../data/models/sign_in_request.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, String>> signIn(String email, String password) async {
    try {
      final response = await _remoteDataSource.signIn(SignInRequest(email: email, password: password));
      return Right(response.token);
    } on Exception catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        return const Left(InvalidCredentialsFailure());
      }
      return const Left(ServerFailure());
    }
  }
}