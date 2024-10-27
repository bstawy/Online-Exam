import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/subjects/data/apis_manager/exams_apis_manager.dart';
import 'package:online_exam/features/subjects/data/data_sources_impl/remote_exams_data_source_impl.dart';
import 'package:online_exam/features/subjects/data/repos_impl/exams_repo_impl.dart';
import 'package:online_exam/features/subjects/domain/repos/exams_repo.dart';
import 'package:online_exam/features/subjects/domain/use_cases/get_all_exams_use_case.dart';
import 'package:online_exam/features/subjects/presentation/cubit/exams_cubit.dart';

import '../../features/subjects/data/data_sources/remote_exams_data_source.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

void setupExamsFeature() {
  // APIs
  getIt.registerLazySingleton(() => ExamsApisManager(getIt()));

  // Data Sources
  getIt.registerLazySingleton<RemoteExamsDataSource>(
    () => RemoteExamsDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<ExamsRepo>(
    () => ExamsRepoImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetAllExamsUseCase(getIt()));

  // Cubits
  getIt.registerFactory(() => ExamsCubit(getIt()));
}
