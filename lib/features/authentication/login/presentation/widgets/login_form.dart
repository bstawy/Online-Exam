import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/theme/colors_manager.dart';
import 'package:online_exam/features/authentication/login/presentation/cubit/login_cubit.dart';
import 'package:online_exam/features/authentication/login/presentation/cubit/login_state.dart';

import 'custom_text_field.dart';
import 'login_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successful')),
          );
        }
        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error ?? 'Login Failed')),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: 'Enter your email',
                errorText:
                    !state.isEmailValid ? 'This Email is not valid' : null,
                onChanged: (email) =>
                    context.read<LoginCubit>().emailChanged(email),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Enter your password',
                obscureText: true,
                errorText: !state.isPasswordValid
                    ? 'Password must be at least 6 characters'
                    : null,
                onChanged: (password) =>
                    context.read<LoginCubit>().passwordChanged(password),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  const Text('Remember me'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: ColorsManager.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              LoginButton(
                onPressed: () => context.read<LoginCubit>().loginSubmitted(),
                isLoading: state.status == LoginStatus.loading,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: ColorsManager.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
