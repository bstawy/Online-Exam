import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api_result.dart';
import 'package:online_exam/core/networking/errors/api_error_handler.dart';
import 'package:online_exam/features/authentication/domain/use_cases/forget_password_use_case.dart';
import 'package:online_exam/features/authentication/presentation/forget_password/cubit/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordCubit(this._forgetPasswordUseCase)
      : super(ForgetPasswordInitial());

  void forgetPassword(String email) async {
    if (!_isValidEmail(email)) {
      emit(ForgetPasswordValidationFailure('This Email is not valid'));
      return;
    }

    emit(ForgetPasswordLoading());

    final response = await _forgetPasswordUseCase.call(email);

    switch (response) {
      case Success():
        emit(ForgetPasswordSuccess());
      case Failure():
        emit(
          ForgetPasswordFailure(
            ApiErrorHandler.handle(response.exception),
          ),
        );
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
