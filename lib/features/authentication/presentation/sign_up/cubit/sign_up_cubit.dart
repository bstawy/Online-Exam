import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/errors/api_error_handler.dart';
import '../../../../../core/networking/errors/api_error_model.dart';
import '../../../data/models/requests/sign_up_request_model.dart';
import '../../../domain/use_cases/sign_up_use_case.dart';

part 'sign_up_cubit_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  void signUp(SignUpRequestBodyModel signUpData) async {
    emit(SignUpLoading());
    final response = await _signUpUseCase.call(signUpData);

    switch (response) {
      case Success():
        emit(SignUpSuccess());
      case Failure():
        emit(
          SignUpFail(
            ApiErrorHandler.handle(response.exception),
          ),
        );
    }
  }
}
