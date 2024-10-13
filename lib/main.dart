import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/service_locator/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_bloc_observer.dart';
import 'features/authentication/presentation/login/cubit/login_cubit.dart';
import 'features/authentication/presentation/login/ui/pages/login_page.dart';
import 'features/authentication/presentation/reset_password/cubit/reset_password_cubit.dart';
import 'features/authentication/presentation/reset_password/ui/pages/forget_password_page.dart';
import 'features/authentication/presentation/reset_password/ui/pages/pin_verification_page.dart';
import 'features/authentication/presentation/reset_password/ui/pages/reset_password_page.dart';
import 'features/authentication/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'features/authentication/presentation/sign_up/ui/pages/sign_up_page.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void main() {
  configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Online Exam',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          navigatorKey: navKey,
          initialRoute: LoginPage.routeName,
          routes: _routes,
        );
      },
    );
  }
}

Map<String, WidgetBuilder> _routes = {
  LoginPage.routeName: (context) => BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginPage(),
      ),
  SignUpPage.routeName: (context) => BlocProvider(
        create: (context) => getIt<SignUpCubit>(),
        child: const SignUpPage(),
      ),
  ForgetPasswordPage.routeName: (context) => BlocProvider(
        create: (context) => getIt<ResetPasswordCubit>(),
        child: const ForgetPasswordPage(),
      ),
  PinVerificationPage.routeName: (context) => BlocProvider(
        create: (context) => getIt<ResetPasswordCubit>(),
        child: const PinVerificationPage(),
      ),
  ResetPasswordPage.routeName: (context) => BlocProvider(
        create: (context) => getIt<ResetPasswordCubit>(),
        child: const ResetPasswordPage(),
      ),
};
