import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../../forget_password/ui/pages/pin_verification_page.dart';
import '../../cubit/login_cubit.dart';

class ForgetPasswordListener extends StatelessWidget {
  const ForgetPasswordListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        if (previous is LoginForgetPasswordLoading &&
            current is! LoginForgetPasswordLoading) {
          context.pop();
        }
        if (current is LoginForgetPasswordLoading ||
            current is LoginForgetPasswordSuccess ||
            current is LoginForgetPasswordFail) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is LoginForgetPasswordLoading) {
          showLoadingDialog();
        } else if (state is LoginForgetPasswordSuccess) {
          showSuccessDialog(
            msg: 'A verification code has been sent to your email',
            whenAnimationFinished: () {
              context.pushNamed(PinVerificationPage.routeName);
            },
          );
        } else if (state is LoginForgetPasswordFail) {
          showErrorDialog(state.apiErrorModel.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
