import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/service_locator/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_bloc_observer.dart';
import 'features/authentication/presentation/login/pages/login_page.dart';
import 'features/authentication/presentation/sign_up/sign_up_page.dart';
import 'features/authentication/presentation/sign_up/view_model/sign_up_view_model.dart';

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
          initialRoute: SignUpPage.routeName,
          routes: _routes,
        );
      },
    );
  }
}

Map<String, WidgetBuilder> _routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  SignUpPage.routeName: (context) => BlocProvider(
        create: (context) => getIt<SignUpViewModel>(),
        child: const SignUpPage(),
      ),
};
