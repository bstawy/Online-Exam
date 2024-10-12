part of 'reset_password_cubit.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class VerifyResetCodeLoading extends ResetPasswordState {}

final class VerifyResetCodeSuccess extends ResetPasswordState {}

final class VerifyResetCodeFailure extends ResetPasswordState {
  final ApiErrorModel apiErrorModel;

  VerifyResetCodeFailure(this.apiErrorModel);
}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {}

final class ResetPasswordFailure extends ResetPasswordState {
  final ApiErrorModel apiErrorModel;

  ResetPasswordFailure(this.apiErrorModel);
}
