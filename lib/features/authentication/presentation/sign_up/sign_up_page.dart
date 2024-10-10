import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/font_weight_helper.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/utils/loading_dialog.dart';
import '../../../../core/utils/validators.dart';
import '../../data/models/requests/sign_up_request_model.dart';
import '../widgets/custom_input_field.dart';
import 'view_model/sign_up_view_model.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _userNameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void signUp() async {
    // if (_formKey.currentState!.validate()) {
    //   // Call the API to sign up the user

    // }
    context.read<SignUpViewModel>().signUp(
          SignUpRequestBodyModel(
            userName: _userNameController.text,
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
            phone: _phoneNumberController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyles = Theme.of(context).textTheme;
    final customColors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: BlocListener<SignUpViewModel, SignUpState>(
            listenWhen: (previous, current) {
              if (previous is SignUpLoading && current is! SignUpLoading) {
                Navigator.of(context).pop();
              }
              return true;
            },
            listener: (context, state) {
              if (state is SignUpLoading) {
                showLoading();
              } else if (state is SignUpSuccess) {
              } else if (state is SignUpFailure) {
                showErrorDialog(state.apiErrorModel.message);
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(24.h),
                  CustomInputField(
                    controller: _userNameController,
                    label: 'User name',
                    hint: 'Enter your user name',
                    validator: (value) => Validators.validateNotEmpty(
                      title: 'User name',
                      value: value,
                    ),
                  ),
                  Gap(24.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          controller: _firstNameController,
                          label: 'First name',
                          hint: 'Enter your first name',
                          validator: (value) => Validators.validateNotEmpty(
                            title: 'First name',
                            value: value,
                          ),
                        ),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: CustomInputField(
                          controller: _lastNameController,
                          label: 'Last name',
                          hint: 'Enter your last name',
                          validator: (value) => Validators.validateNotEmpty(
                            title: 'Last name',
                            value: value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(24.h),
                  CustomInputField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Enter your email',
                    validator: Validators.validateEmail,
                  ),
                  Gap(24.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: 'Enter your password',
                          isPassword: true,
                          validator: Validators.validatePassword,
                        ),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: CustomInputField(
                          controller: _confirmPasswordController,
                          label: 'Confirm password',
                          hint: 'Enter your password again',
                          isPassword: true,
                          validator: (value) =>
                              Validators.validatePasswordConfirmation(
                            password: _passwordController.text,
                            confirmPassword: value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(24.h),
                  CustomInputField(
                    controller: _phoneNumberController,
                    label: 'Phone number',
                    hint: 'Enter your phone number',
                    action: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    validator: Validators.validatePhoneNumber,
                  ),
                  Gap(48.h),
                  ElevatedButton(
                    onPressed: () => signUp(),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48.h),
                      backgroundColor: customColors.primary,
                      disabledBackgroundColor: ColorsManager.grey,
                    ),
                    child: Text(
                      'Sign up',
                      style: customTextStyles.labelLarge,
                    ),
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: customTextStyles.labelLarge?.copyWith(
                          color: ColorsManager.black,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(15.r),
                        child: RichText(
                          text: TextSpan(
                            text: 'Login',
                            style: customTextStyles.labelLarge?.copyWith(
                              color: ColorsManager.blue, // Text color
                              fontWeight: FontWeightHelper.medium,
                              decoration: TextDecoration
                                  .underline, // Underline the text
                              decorationColor:
                                  ColorsManager.blue, // Set the underline color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
