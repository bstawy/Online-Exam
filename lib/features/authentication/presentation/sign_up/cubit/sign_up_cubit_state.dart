part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFail extends SignUpState {
  final ApiErrorModel apiErrorModel;

  SignUpFail(this.apiErrorModel);
}
