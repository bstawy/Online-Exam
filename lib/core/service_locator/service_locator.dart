import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:online_exam/features/authentication/domain/use_cases/sign-in-use-case.dart';
import 'package:online_exam/features/authentication/login/data/datasources/auth-remote-data-source.dart';
import 'package:online_exam/features/authentication/login/data/datasources/auth_api_service.dart';
import 'package:online_exam/features/authentication/login/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/authentication/login/domain/repositories/auth_repository_impl.dart';
import 'package:online_exam/features/authentication/presentation/login/cubit/login_cubit.dart';


final getIt = GetIt.instance;

void configureDependencies() {
  // External
  getIt.registerLazySingleton(() => Dio());

  // Data sources
  getIt.registerLazySingleton(() => AuthApiService(getIt<Dio>()));
  getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(getIt<AuthApiService>()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton(() => SignInUseCase(getIt<AuthRepository>()));

  // Cubits
  getIt.registerFactory(() => LoginCubit(getIt<SignInUseCase>()));
}