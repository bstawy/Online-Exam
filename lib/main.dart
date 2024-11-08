import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/caching/tokens_manager.dart';
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
import 'features/exam/presentation/cubit/exam_cubit.dart';
import 'features/exam/presentation/ui/questions_screen.dart';
import 'features/layout/presentation/ui/layout_screen.dart';
import 'features/result/presentation/ui/result_screen.dart';
import 'features/subjects/presentation/ui/pages/exams/ui/exams_page.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = AppBlocObserver();

  Future.wait([
    TokensManager.isTokenTemp(),
    TokensManager.getToken(),
  ]).then((value) {
    String isTokenTemp = value.first ?? 'true';
    String token = value[1] ?? "";

    if (isTokenTemp == 'true') {
      token = "";
      TokensManager.clear();
    }

    if (token.isNotEmpty) {
      runApp(
        const OnlineExamApp(initialRoute: LayoutScreen.routeName),
      );
    } else {
      runApp(
        const OnlineExamApp(),
      );
    }
  });
}

class OnlineExamApp extends StatelessWidget {
  final String initialRoute;

  const OnlineExamApp({
    super.key,
    this.initialRoute = LoginPage.routeName,
  });

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
          initialRoute: initialRoute,
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
  LayoutScreen.routeName: (context) => const LayoutScreen(),
  ExamsPage.routeName: (context) => const ExamsPage(),
  QuestionsScreen.routeName: (context) => BlocProvider(
        create: (context) => getIt<ExamCubit>(),
        child: const QuestionsScreen(),
      ),
  ResultScreen.routeName: (context) => const ResultScreen(),
};
