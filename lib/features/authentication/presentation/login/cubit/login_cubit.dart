import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/errors/api_error_handler.dart';
import '../../../../../core/networking/errors/api_error_model.dart';
import '../../../data/models/requests/login_request_model.dart';
import '../../../data/models/responses/login_response_model.dart';
import '../../../domain/use_cases/forget_password_use_case.dart';
import '../../../domain/use_cases/login_use_case.dart';

part 'login_cubit_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  bool rememberUser = false;

  LoginCubit(this._loginUseCase, this._forgetPasswordUseCase)
      : super(LoginInitial());

  void login(LoginRequestBodyModel loginData) async {
    emit(LoginLoading());

    final response = await _loginUseCase.call(loginData);

    switch (response) {
      case Success():
        emit(LoginSuccess(response.data!));
      case Failure():
        emit(
          LoginFail(
            ApiErrorHandler.handle(response.exception),
          ),
        );
    }
  }

  void forgetPassword(String email) async {
    emit(LoginForgetPasswordLoading());

    final response = await _forgetPasswordUseCase.call(email);

    switch (response) {
      case Success():
        emit(LoginForgetPasswordSuccess());
      case Failure():
        emit(
          LoginForgetPasswordFail(
            ApiErrorHandler.handle(response.exception),
          ),
        );
    }
  }
}
