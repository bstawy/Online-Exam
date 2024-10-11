part of 'sign_up_view_model.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final ApiErrorModel apiErrorModel;

  SignUpFailure(this.apiErrorModel);
}
