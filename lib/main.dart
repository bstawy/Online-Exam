import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/authentication/login/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/authentication/login/domain/repositories/auth_repository_impl.dart';
import 'package:online_exam/features/authentication/login/presentation/cubit/login_cubit.dart';
import 'package:online_exam/features/authentication/login/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(Dio()),
      child: MaterialApp(
        title: 'Online Exam',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) => LoginCubit(context.read<AuthRepository>()),
          child: const LoginPage(),
        ),
      ),
    );
  }
}