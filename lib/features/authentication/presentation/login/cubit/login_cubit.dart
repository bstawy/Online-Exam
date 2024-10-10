import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures_dart.dart';
import '../../../login/domain/repositories/auth_repository.dart';
import 'login_state.dart';

/// `LoginCubit` manages the logic and state for the login screen in the authentication feature.
/// It extends the `Cubit` from the `flutter_bloc` package, and its state is of type `LoginState`.
/// The class interacts with an `AuthRepository` to perform authentication and manages state
/// changes such as email and password validation, form submission, and login result handling.
class LoginCubit extends Cubit<LoginState> {
  /// A repository that handles the login process, typically interacting with an API
  final AuthRepository _authRepository;

  /// Constructor for `LoginCubit`. Takes an instance of `AuthRepository` and initializes
  /// the state using the default `LoginState`.
  ///
  /// @param `authRepository` - The repository that handles login logic (API calls, etc.).
  LoginCubit(this._authRepository) : super(const LoginState());

  /// This method is triggered when the user changes the email input.
  /// It performs a regex validation on the email to ensure it's in a valid format.
  /// The state is updated with the new email and its validity status.
  ///
  /// @param `value` - The email entered by the user.
  void emailChanged(String value) {
    /// A regex pattern that validates email format.
    final bool isValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);

    /// Emits a new state with the updated email and its validation status.
    emit(state.copyWith(
      email: value,
      isEmailValid: isValid,
    ));
  }

  /// This method is triggered when the user changes the password input.
  /// It checks if the password length is at least 6 characters long (a basic validation).
  /// The state is updated with the new password and its validity status.
  ///
  /// @param `value` - The password entered by the user.
  void passwordChanged(String value) {
    /// Emits a new state with the updated password and its validation status.
    emit(state.copyWith(
      password: value,
      isPasswordValid: value.length >= 6,
    ));
  }

  /// This method is triggered when the user submits the login form.
  /// It checks if the form (email and password) is valid. If valid, it calls the `signIn` method
  /// of `_authRepository` to authenticate the user. If authentication is successful, the status
  /// is updated to `success`, otherwise an error message is shown.
  ///
  /// @return A `Future<void>` indicating asynchronous operation.
  Future<void> loginSubmitted() async {
    /// Check if the form is valid before proceeding with login.
    if (state.isFormValid) {
      /// Update the state to `loading` status while the authentication request is processed.
      emit(state.copyWith(status: LoginStatus.loading));

      /// Attempt to authenticate the user with the provided email and password.
      final result = await _authRepository.signIn(state.email, state.password);

      /// Handle the result of the authentication request.
      /// If it fails, display the appropriate error message; if successful, update the status to `success`.
      result.fold(
        (failure) => emit(state.copyWith(
            status: LoginStatus.failure, error: _mapFailureToMessage(failure))),
        (token) => emit(state.copyWith(status: LoginStatus.success)),
      );
    } else {
      /// If the form is invalid, emit a failure state with an error message.
      emit(state.copyWith(
          status: LoginStatus.failure, error: 'Invalid email or password'));
    }
  }

  /// This method maps different types of failures to corresponding error messages.
  /// It takes a `Failure` object and returns a user-friendly error message based on the failure type.
  ///
  /// @param `failure` - The `Failure` object representing different login errors (e.g., server failure, invalid credentials).
  /// @return A `String` containing the error message to be displayed.
  String _mapFailureToMessage(Failure failure) {
    /// Mapping failure types to specific error messages.
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server error occurred';
      case InvalidCredentialsFailure:
        return 'Invalid email or password';
      default:
        return 'Unexpected error';
    }
  }
}
