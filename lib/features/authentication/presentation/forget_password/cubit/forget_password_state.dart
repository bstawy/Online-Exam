import 'package:online_exam/core/networking/errors/api_error_model.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {
  final ApiErrorModel apiErrorModel;

  ForgetPasswordFailure(this.apiErrorModel);
}

class ForgetPasswordValidationFailure extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordValidationFailure(this.errorMessage);
}
