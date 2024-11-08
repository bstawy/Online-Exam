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

import '../../features/authentication/data/apis_manager/auth_apis_manager.dart'
    as _i768;
import '../../features/authentication/data/data_sources/remote_auth_data_source.dart'
    as _i318;
import '../../features/authentication/data/data_sources_impl/remote_auth_data_source_impl.dart'
    as _i292;
import '../../features/authentication/data/repos_impl/auth_repo_impl.dart'
    as _i1017;
import '../../features/authentication/domain/repos/auth_repo.dart' as _i1006;
import '../../features/authentication/domain/use_cases/forget_password_use_case.dart'
    as _i582;
import '../../features/authentication/domain/use_cases/login_use_case.dart'
    as _i146;
import '../../features/authentication/domain/use_cases/reset_password_use_case.dart'
    as _i624;
import '../../features/authentication/domain/use_cases/sign_up_use_case.dart'
    as _i497;
import '../../features/authentication/domain/use_cases/verify_reset_code_use_case.dart'
    as _i182;
import '../../features/authentication/presentation/login/cubit/login_cubit.dart'
    as _i339;
import '../../features/authentication/presentation/reset_password/cubit/reset_password_cubit.dart'
    as _i20;
import '../../features/authentication/presentation/sign_up/cubit/sign_up_cubit.dart'
    as _i1001;
import '../../features/exam/data/apis_manager/exam_apis_manager.dart' as _i715;
import '../../features/exam/data/data_sources/remote_questions_data_source.dart'
    as _i986;
import '../../features/exam/data/data_sources_impl/remote_questions_data_source_impl.dart'
    as _i171;
import '../../features/exam/data/repos_impl/exam_repo_impl.dart' as _i145;
import '../../features/exam/domain/repos/exam_repo.dart' as _i569;
import '../../features/exam/domain/use_cases/get_exam_questions.dart' as _i748;
import '../../features/exam/domain/use_cases/submit_exam_answers_use_case.dart'
    as _i803;
import '../../features/exam/presentation/cubit/exam_cubit.dart' as _i622;
import '../../features/subjects/data/apis_manager/subjects_apis_manager.dart'
    as _i201;
import '../../features/subjects/data/data_sources/remote_subjects_data_source.dart'
    as _i910;
import '../../features/subjects/data/data_sources_impl/remote_subjects_data_source_impl.dart'
    as _i489;
import '../../features/subjects/data/repos_impl/subjects_repo_impl.dart'
    as _i210;
import '../../features/subjects/domain/repos/subjects_repo.dart' as _i602;
import '../../features/subjects/domain/use_cases/get_all_exams_use_case.dart'
    as _i59;
import '../../features/subjects/domain/use_cases/get_all_subjects_use_case.dart'
    as _i173;
import '../../features/subjects/presentation/cubit/exams_cubit.dart' as _i289;
import '../../features/subjects/presentation/cubit/subjects_cubit.dart'
    as _i722;
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
    gh.lazySingleton<_i768.AuthApisManager>(
        () => _i768.AuthApisManager(gh<_i361.Dio>()));
    gh.lazySingleton<_i201.SubjectsApisManager>(
        () => _i201.SubjectsApisManager(gh<_i361.Dio>()));
    gh.lazySingleton<_i715.ExamApisManager>(
        () => _i715.ExamApisManager(gh<_i361.Dio>()));
    gh.factory<_i910.RemoteSubjectsDataSource>(() =>
        _i489.RemoteSubjectsDataSourceImpl(gh<_i201.SubjectsApisManager>()));
    gh.factory<_i986.RemoteQuestionsDataSource>(
        () => _i171.RemoteQuestionsDataSourceImpl(gh<_i715.ExamApisManager>()));
    gh.factory<_i318.RemoteAuthDataSource>(
        () => _i292.RemoteAuthDataSourceImpl(gh<_i768.AuthApisManager>()));
    gh.factory<_i602.SubjectsRepo>(
        () => _i210.SubjectsRepoImpl(gh<_i910.RemoteSubjectsDataSource>()));
    gh.factory<_i569.ExamRepo>(
        () => _i145.ExamRepoImpl(gh<_i986.RemoteQuestionsDataSource>()));
    gh.factory<_i173.GetAllSubjectsUseCase>(
        () => _i173.GetAllSubjectsUseCase(gh<_i602.SubjectsRepo>()));
    gh.factory<_i59.GetAllExamsUseCase>(
        () => _i59.GetAllExamsUseCase(gh<_i602.SubjectsRepo>()));
    gh.factory<_i803.SubmitExamAnswersUseCase>(
        () => _i803.SubmitExamAnswersUseCase(gh<_i569.ExamRepo>()));
    gh.factory<_i748.GetExamQuestions>(
        () => _i748.GetExamQuestions(gh<_i569.ExamRepo>()));
    gh.factory<_i622.ExamCubit>(() => _i622.ExamCubit(
          gh<_i748.GetExamQuestions>(),
          gh<_i803.SubmitExamAnswersUseCase>(),
        ));
    gh.factory<_i1006.AuthRepo>(
        () => _i1017.AuthRepoImpl(gh<_i318.RemoteAuthDataSource>()));
    gh.factory<_i146.LoginUseCase>(
        () => _i146.LoginUseCase(gh<_i1006.AuthRepo>()));
    gh.factory<_i722.SubjectsCubit>(
        () => _i722.SubjectsCubit(gh<_i173.GetAllSubjectsUseCase>()));
    gh.factory<_i339.LoginCubit>(
        () => _i339.LoginCubit(gh<_i146.LoginUseCase>()));
    gh.factory<_i582.ForgetPasswordUseCase>(
        () => _i582.ForgetPasswordUseCase(gh<_i1006.AuthRepo>()));
    gh.factory<_i497.SignUpUseCase>(
        () => _i497.SignUpUseCase(gh<_i1006.AuthRepo>()));
    gh.factory<_i182.VerifyResetCodeUseCase>(
        () => _i182.VerifyResetCodeUseCase(gh<_i1006.AuthRepo>()));
    gh.factory<_i289.ExamsCubit>(
        () => _i289.ExamsCubit(gh<_i59.GetAllExamsUseCase>()));
    gh.factory<_i624.ResetPasswordUseCase>(
        () => _i624.ResetPasswordUseCase(gh<_i1006.AuthRepo>()));
    gh.factory<_i1001.SignUpCubit>(
        () => _i1001.SignUpCubit(gh<_i497.SignUpUseCase>()));
    gh.factory<_i20.ResetPasswordCubit>(() => _i20.ResetPasswordCubit(
          gh<_i582.ForgetPasswordUseCase>(),
          gh<_i182.VerifyResetCodeUseCase>(),
          gh<_i624.ResetPasswordUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i49.DioModule {}
