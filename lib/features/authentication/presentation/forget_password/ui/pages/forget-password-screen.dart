import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/authentication/presentation/forget_password/cubit/forget-password-cubit.dart';
import 'package:online_exam/features/authentication/presentation/forget_password/cubit/forget_password_state.dart';
import 'package:online_exam/features/authentication/presentation/forget_password/ui/pages/pin_verification_page.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(context.read()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Password'),
        ),
        body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Reset code sent to your email')),
              );
              Navigator.pushNamed(context, PinVerificationPage.routeName);
            } else if (state is ForgetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.apiErrorModel.message)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Forget password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please enter your email associated to your account',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      errorText: state is ForgetPasswordValidationFailure
                          ? state.errorMessage
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: state is ForgetPasswordLoading
                        ? null
                        : () {
                            final email = _emailController.text;
                            if (email.isNotEmpty) {
                              context
                                  .read<ForgetPasswordCubit>()
                                  .forgetPassword(email);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: state is ForgetPasswordLoading
                        ? const CircularProgressIndicator()
                        : const Text('Continue'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
