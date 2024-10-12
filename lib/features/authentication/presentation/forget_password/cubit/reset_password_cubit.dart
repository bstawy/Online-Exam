import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/errors/api_error_handler.dart';
import '../../../../../core/networking/errors/api_error_model.dart';
import '../../../domain/use_cases/verify_reset_code_use_case.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;

  ResetPasswordCubit(this._verifyResetCodeUseCase)
      : super(ResetPasswordInitial());

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
}
