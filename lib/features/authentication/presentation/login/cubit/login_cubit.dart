import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/errors/api_error_handler.dart';
import '../../../../../core/networking/errors/api_error_model.dart';
import '../../../data/models/requests/login_request_model.dart';
import '../../../domain/use_cases/login_use_case.dart';

part 'login_cubit_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  void login(LoginRequestBodyModel loginData) async {
    emit(LoginLoading());

    final response = await _loginUseCase.call(loginData);

    switch (response) {
      case Success():
        // TODO: cache token
        emit(LoginSuccess());
      case Failure():
        emit(
          LoginFail(
            ApiErrorHandler.handle(response.exception),
          ),
        );
    }
  }
}
