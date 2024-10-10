import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/failures_dart.dart';
import '../../data/datasources/auth_api_service.dart';
import '../../data/models/sign_in_request.dart';
import 'auth_repository.dart';

/// `AuthRepositoryImpl` is the concrete implementation of the `AuthRepository` interface.
/// It interacts with the authentication API service to manage user sign-in operations.
/// It uses the `Dio` package to handle HTTP requests and error handling.
class AuthRepositoryImpl implements AuthRepository {
  /// A service that handles the API calls related to authentication.
  final AuthApiService _apiService;

  /// Constructor for `AuthRepositoryImpl`.
  /// It takes a `Dio` instance to initialize the `AuthApiService`.
  ///
  /// @param `dio` - An instance of `Dio` for making HTTP requests.
  AuthRepositoryImpl(Dio dio) : _apiService = AuthApiService(dio);

  /// Signs in a user using their email and password.
  /// This method sends a sign-in request to the server using the API service.
  /// If the sign-in is successful, it returns the token; otherwise, it handles various errors.
  ///
  /// @param `email` - The user's email address.
  /// @param `password` - The user's password.
  ///
  /// @return A `Future<Either<Failure, String>>`, where:
  /// - `Left<Failure>` is returned if the sign-in fails (e.g., due to invalid credentials or server error).
  /// - `Right<String>` is returned if the sign-in is successful, containing the authentication token.
  @override
  Future<Either<Failure, String>> signIn(String email, String password) async {
    try {
      /// Send the sign-in request to the API.
      final response = await _apiService
          .signIn(SignInRequest(email: email, password: password));

      /// If successful, return the token received in the response.
      return Right(response.token);
    } on DioException catch (e) {
      /// Handle 401 error (invalid credentials) by returning `InvalidCredentialsFailure`.
      if (e.response?.statusCode == 401) {
        return const Left(InvalidCredentialsFailure());
      }

      /// Handle other server-related errors by returning `ServerFailure`.
      return const Left(ServerFailure());
    } catch (e) {
      /// Handle any other unexpected errors.
      return const Left(UnexpectedFailure());
    }
  }
}
