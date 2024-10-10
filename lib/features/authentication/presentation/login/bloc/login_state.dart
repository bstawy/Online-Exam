//class LoginState {
//   final String email;
//   final String password;
//   final bool isEmailValid;
//   final bool isPasswordValid;
//
//   LoginState({
//     this.email = '',
//     this.password = '',
//     this.isEmailValid = true,
//     this.isPasswordValid = true,
//   });
//
//   bool get isFormValid => isEmailValid && isPasswordValid && email.isNotEmpty && password.isNotEmpty;
//
//   LoginState copyWith({
//     String? email,
//     String? password,
//     bool? isEmailValid,
//     bool? isPasswordValid,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       isEmailValid: isEmailValid ?? this.isEmailValid,
//       isPasswordValid: isPasswordValid ?? this.isPasswordValid,
//     );
//   }
// }
//
// class LoginInitial extends LoginState {}
//
// class LoginLoading extends LoginState {}
//
// class LoginSuccess extends LoginState {}
//
// class LoginFailure extends LoginState {
//   final String error;
//   LoginFailure({required this.error});
// }
