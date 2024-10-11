import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/authentication/domain/use_cases/sign-in-use-case.dart';

import '../../../../../core/error/failures_dart.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final SignInUseCase _signInUseCase;

  LoginCubit(this._signInUseCase) : super(const LoginState());

  void emailChanged(String value) {
    final bool isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    emit(state.copyWith(email: value, isEmailValid: isValid));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, isPasswordValid: value.length >= 6));
  }

  Future<void> loginSubmitted() async {
    if (state.isFormValid) {
      emit(state.copyWith(status: LoginStatus.loading));
      final result = await _signInUseCase(state.email, state.password);
      result.fold(
            (failure) => emit(state.copyWith(status: LoginStatus.failure, error: _mapFailureToMessage(failure))),
            (token) => emit(state.copyWith(status: LoginStatus.success)),
      );
    } else {
      emit(state.copyWith(status: LoginStatus.failure, error: 'Invalid email or password'));
    }
  }

  String _mapFailureToMessage(Failure failure) {
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