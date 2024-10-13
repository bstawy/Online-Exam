import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/caching/tokens_manager.dart';
import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../../sign_up/ui/pages/sign_up_page.dart';
import '../../cubit/login_cubit.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        if (previous is LoginLoading && current is! LoginLoading) {
          context.pop();
        }
        if (current is LoginLoading ||
            current is LoginSuccess ||
            current is LoginFail) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is LoginLoading) {
          showLoadingDialog();
        } else if (state is LoginSuccess) {
          showSuccessDialog(
            whenAnimationFinished: () {
              if (context.read<LoginCubit>().rememberUser) {
                final userData = state.userData;

                if (userData.token != null) {
                  TokensManager.setToken(state.userData.token ?? '');
                } else {
                  showErrorDialog('Token is null');
                }
              }
              // TODO: navigate to home screen
              context.pushNamed(SignUpPage.routeName);
            },
          );
        } else if (state is LoginFail) {
          showErrorDialog(state.apiErrorModel.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
