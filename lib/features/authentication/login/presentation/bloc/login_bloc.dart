//import 'package:flutter_bloc/flutter_bloc.dart';
// import 'login_event.dart';
// import 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial()) {
//     on<EmailChanged>(_onEmailChanged);
//     on<PasswordChanged>(_onPasswordChanged);
//     on<LoginSubmitted>(_onLoginSubmitted);
//   }
//
//   void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
//     final email = event.email;
//     emit(state.copyWith(
//       email: email,
//       isEmailValid: _isEmailValid(email),
//     ));
//   }
//
//   void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
//     final password = event.password;
//     emit(state.copyWith(
//       password: password,
//       isPasswordValid: password.length >= 6,
//     ));
//   }
//
//   void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) {
//     if (state.isFormValid) {
//       emit(LoginLoading());
//       // Simulate API call
//       Future.delayed(Duration(seconds: 2), () {
//         emit(LoginSuccess());
//       });
//     } else {
//       emit(LoginFailure(error: 'Invalid email or password'));
//     }
//   }
//
//   bool _isEmailValid(String email) {
//     return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
//   }
// }
