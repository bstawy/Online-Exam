// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/authentication/data/data_sources/remote_auth_data_source.dart'
    as _i318;
import '../../features/authentication/data/data_sources_impl/remote_auth_data_source_impl.dart'
    as _i292;
import '../../features/authentication/data/repos_impl/auth_repo_impl.dart'
    as _i1017;
import '../../features/authentication/domain/repos/auth_repo.dart' as _i1006;
import '../../features/authentication/domain/use_cases/sign_up_use_case.dart'
    as _i497;
import '../../features/authentication/presentation/sign_up/view_model/sign_up_view_model.dart'
    as _i261;
import '../networking/api_manager/api_manager.dart' as _i241;
import '../networking/dio/dio_factory.dart' as _i1046;
import '../networking/dio/dio_module.dart' as _i49;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i1046.DioFactory>(() => _i1046.DioFactory());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i241.ApiManager>(() => _i241.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i318.RemoteAuthDataSource>(
        () => _i292.RemoteAuthDataSourceImpl(gh<_i241.ApiManager>()));
    gh.factory<_i1006.AuthRepo>(
        () => _i1017.AuthRepoImpl(gh<_i318.RemoteAuthDataSource>()));
    gh.factory<_i497.SignUpUseCase>(
        () => _i497.SignUpUseCase(gh<_i1006.AuthRepo>()));
    gh.factory<_i261.SignUpViewModel>(
        () => _i261.SignUpViewModel(gh<_i497.SignUpUseCase>()));
    return this;
  }
}

class _$DioModule extends _i49.DioModule {}
