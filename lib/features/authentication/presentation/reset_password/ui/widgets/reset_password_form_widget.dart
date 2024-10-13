import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/validators.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_field.dart';

class ResetPasswordFormWidget extends StatefulWidget {
  const ResetPasswordFormWidget({super.key});

  @override
  State<ResetPasswordFormWidget> createState() =>
      _ResetPasswordFormWidgetState();
}

class _ResetPasswordFormWidgetState extends State<ResetPasswordFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void resetPassword() {
    if (_formKey.currentState!.validate()) {
      // context.read<ResetPasswordCubit>().resetPassword(
      //       ResetPasswordRequestBodyModel(
      //         newPassword: _newPasswordController.text,
      //         confirmPassword: _confirmPasswordController.text,
      //       ),
      //     );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInputField(
            controller: _newPasswordController,
            label: 'New Password',
            hint: 'Enter your new password',
            isPassword: true,
            validator: Validators.validatePassword,
          ),
          Gap(24.h),
          CustomInputField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            hint: 'Confirm Password',
            isPassword: true,
            validator: Validators.validatePassword,
          ),
          Gap(48.h),
          CustomButton(
            onPressed: resetPassword,
            text: 'Continue',
          ),
        ],
      ),
    );
  }
}
