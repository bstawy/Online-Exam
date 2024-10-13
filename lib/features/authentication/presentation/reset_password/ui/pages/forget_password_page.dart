import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/theme/colors_manager.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../../cubit/reset_password_cubit.dart';
import '../widgets/forget_password_listener.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String routeName = '/forget-password';
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void forgetPassword() async {
    if (_formKey.currentState!.validate()) {
      context.read<ResetPasswordCubit>().forgetPassword(_emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ForgetPasswordListener(),
              Gap(40.h),
              Text(
                'Forget password',
                textAlign: TextAlign.center,
                style: customTextStyles.headlineSmall,
              ),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Text(
                  'Please enter your email associated to your account',
                  textAlign: TextAlign.center,
                  style: customTextStyles.bodyLarge?.copyWith(
                    color: ColorsManager.grey,
                  ),
                ),
              ),
              Gap(32.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomInputField(
                      controller: _emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                      validator: Validators.validateEmail,
                    ),
                    Gap(48.h),
                    CustomButton(
                      onPressed: () => forgetPassword(),
                      text: 'Continue',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
