import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/theme/colors_manager.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../cubit/reset_password_cubit.dart';
import '../pages/reset_password_page.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    final defaultPinTheme = PinTheme(
      width: double.infinity,
      height: 58.h,
      textStyle: customTextStyles.headlineMedium,
      decoration: BoxDecoration(
        color: ColorsManager.lightBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) {
        if (previous is VerifyResetCodeLoading) {
          context.pop();
        }
        return current is VerifyResetCodeLoading ||
            current is VerifyResetCodeSuccess ||
            current is VerifyResetCodeFailure;
      },
      listener: (context, state) {
        if (state is VerifyResetCodeLoading) {
          showLoadingDialog();
        } else if (state is VerifyResetCodeSuccess) {
          showSuccessDialog(whenAnimationFinished: () {
            context.pushNamed(ResetPasswordPage.routeName);
          });
        } else if (state is VerifyResetCodeFailure) {
          showErrorDialog(state.apiErrorModel.message);
        }
      },
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        length: 6,
        onCompleted: (pin) =>
            context.read<ResetPasswordCubit>().verifyCode(pin),
      ),
    );
  }
}
