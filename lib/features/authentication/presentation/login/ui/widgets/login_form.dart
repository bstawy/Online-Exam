import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/theme/colors_manager.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../data/models/requests/login_request_model.dart';
import '../../../sign_up/ui/pages/sign_up_page.dart';
import '../../../widgets/custom_input_field.dart';
import '../../cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool remeberUser = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
            LoginRequestBodyModel(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        if (previous is LoginLoading && current is! LoginLoading) {
          context.pop();
        }
        return true;
      },
      listener: (context, state) {
        switch (state) {
          case LoginInitial():
            break;
          case LoginLoading():
            showLoadingDialog();
          case LoginSuccess():
            showSuccessDialog(
              whenAnimationFinished: () {
                // TODO: navigate to home screen
                context.pushNamed(SignUpPage.routeName);
              },
            );
          case LoginFail():
            showErrorDialog(state.apiErrorModel.message);
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(24.h),
                CustomInputField(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'Enter your email',
                  validator: Validators.validateEmail,
                ),
                Gap(24.h),
                CustomInputField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Enter your password',
                  isPassword: true,
                  validator: Validators.validatePassword,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: remeberUser,
                      onChanged: (value) {
                        setState(() {
                          remeberUser = value!;
                        });
                      },
                    ),
                    const Text('Remember me'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // TODO: go to forgot password page
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: ColorsManager.blue),
                      ),
                    ),
                  ],
                ),
                Gap(24.h),
                ElevatedButton(
                  onPressed: () => login(),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48.h),
                    backgroundColor: customColors.primary,
                    disabledBackgroundColor: ColorsManager.grey,
                  ),
                  child: Text(
                    'Login',
                    style: customTextStyles.labelLarge,
                  ),
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(SignUpPage.routeName);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: ColorsManager.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
