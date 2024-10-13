import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../cubit/reset_password_cubit.dart';
import '../pages/pin_verification_page.dart';

class ForgetPasswordListener extends StatelessWidget {
  const ForgetPasswordListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) {
        if (previous is ForgetPasswordLoading &&
            current is! ForgetPasswordLoading) {
          context.pop();
        }
        if (current is ForgetPasswordLoading ||
            current is ForgetPasswordSuccess ||
            current is ForgetPasswordFail) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          showLoadingDialog();
        } else if (state is ForgetPasswordSuccess) {
          showSuccessDialog(
            msg: 'A verification code has been sent to your email',
            whenAnimationFinished: () {
              context.pushNamed(PinVerificationPage.routeName);
            },
          );
        } else if (state is ForgetPasswordFail) {
          showErrorDialog(state.apiErrorModel.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
