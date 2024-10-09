import 'package:dartz/dartz.dart';
import 'package:online_exam/core/error/failures_dart.dart';

/// `AuthRepository` is an abstract class that defines the contract for authentication-related
/// operations, specifically user sign-in. Implementations of this repository will provide
/// concrete logic for authentication mechanisms, including API calls or other external services.
abstract class AuthRepository {
  /// Signs in a user using their email and password.
  ///
  /// @param `email` - The user's email address.
  /// @param `password` - The user's password.
  ///
  /// @return A `Future` that resolves to an `Either` object, which represents two possible states:
  /// - `Left<Failure>` if the authentication fails, encapsulating the error type (e.g., invalid credentials).
  /// - `Right<String>` if the authentication is successful, containing the token received from the server.
  Future<Either<Failure, String>> signIn(String email, String password);
}
