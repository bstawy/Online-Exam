part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFail extends LoginState {
  final ApiErrorModel apiErrorModel;

  LoginFail(this.apiErrorModel);
}

final class LoginForgetPasswordLoading extends LoginState {}

final class LoginForgetPasswordSuccess extends LoginState {}

final class LoginForgetPasswordFail extends LoginState {
  final ApiErrorModel apiErrorModel;

  LoginForgetPasswordFail(this.apiErrorModel);
}
