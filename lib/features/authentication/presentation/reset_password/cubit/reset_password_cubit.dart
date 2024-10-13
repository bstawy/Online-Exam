import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/caching/secure_storage_factory.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/errors/api_error_handler.dart';
import '../../../../../core/networking/errors/api_error_model.dart';
import '../../../domain/use_cases/forget_password_use_case.dart';
import '../../../domain/use_cases/reset_password_use_case.dart';
import '../../../domain/use_cases/verify_reset_code_use_case.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(
    this._forgetPasswordUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(ResetPasswordInitial());

  void forgetPassword(String email) async {
    emit(ForgetPasswordLoading());

    final response = await _forgetPasswordUseCase.call(email);

    switch (response) {
      case Success():
        await SecureStorageFactory.write(
          key: "emailToReset",
          value: email,
        );
        emit(ForgetPasswordSuccess());
      case Failure():
        emit(
          ForgetPasswordFail(
            ApiErrorHandler.handle(response.exception),
          ),
        );
    }
  }

  void verifyCode(String pin) async {
    emit(VerifyResetCodeLoading());

    final response = await _verifyResetCodeUseCase.call(pin);

    switch (response) {
      case Success():
        emit(VerifyResetCodeSuccess());
      case Failure():
        emit(
          VerifyResetCodeFailure(
            ApiErrorHandler.handle(response.exception),
          ),
        );
    }
  }

  void resetPassword(String password) async {
    emit(ResetPasswordLoading());

    final email = await SecureStorageFactory.read("emailToReset");

    final response = await _resetPasswordUseCase.call(email ?? '', password);

    switch (response) {
      case Success():
        await SecureStorageFactory.delete("emailToReset");
        emit(ResetPasswordSuccess());
      case Failure():
        emit(
          ResetPasswordFailure(
            ApiErrorHandler.handle(response.exception),
          ),
        );
    }
  }
}
