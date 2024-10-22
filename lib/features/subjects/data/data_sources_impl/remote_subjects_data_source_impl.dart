import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../apis_manager/subjects_apis_manager.dart';
import '../data_sources/remote_subjects_data_source.dart';
import '../models/subjects_response_model.dart';

@Injectable(as: RemoteSubjectsDataSource)
class RemoteSubjectsDataSourceImpl implements RemoteSubjectsDataSource {
  final SubjectsApisManager _apisManager;

  RemoteSubjectsDataSourceImpl(this._apisManager);

  @override
  Future<ApiResult<SubjectsResponseModel>> getAllSubjects(String token) async {
    return await executeApiCall(
      () {
        return _apisManager.getAllSubjects(token);
      },
    );
  }
}
