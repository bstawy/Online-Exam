import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../login/ui/pages/login_page.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../../cubit/reset_password_cubit.dart';

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
      context
          .read<ResetPasswordCubit>()
          .resetPassword(_newPasswordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) {
        if (previous is ResetPasswordLoading &&
            current is! ResetPasswordLoading) {
          context.pop();
        }
        if (current is ResetPasswordLoading ||
            current is ResetPasswordSuccess ||
            current is ResetPasswordFailure) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showLoadingDialog();
        } else if (state is ResetPasswordSuccess) {
          showSuccessDialog(
            whenAnimationFinished: () {
              context.pushNamedAndRemoveUntil(
                LoginPage.routeName,
                predicate: (route) => false,
              );
            },
          );
        } else if (state is ResetPasswordFailure) {
          showErrorDialog(state.apiErrorModel.message);
        }
      },
      child: Form(
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
              validator: (value) => Validators.validatePasswordConfirmation(
                password: _newPasswordController.text,
                confirmPassword: value,
              ),
              doneAction: TextInputAction.done,
            ),
            Gap(48.h),
            CustomButton(
              onPressed: resetPassword,
              text: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
