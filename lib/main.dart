import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/service_locator/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'features/authentication/presentation/sign_up/sign_up_page.dart';

void main() {
  configureDependencies();
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
          home: const SignUpPage(),
        );
      },
    );
  }
}
