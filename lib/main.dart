import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theme/app_theme.dart';
import 'package:online_exam/features/authentication/login/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/authentication/login/domain/repositories/auth_repository_impl.dart';
import 'package:online_exam/features/authentication/login/presentation/cubit/login_cubit.dart';
import 'package:online_exam/features/authentication/login/presentation/pages/login_page.dart';

void main() {
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
        create: (context) => AuthRepositoryImpl(Dio()),
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Online Exam',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.appTheme,
              home: BlocProvider(
                create: (context) => LoginCubit(context.read<AuthRepository>()),
                child: const LoginPage(),
              ),
            );
          },
        ));
  }
}
