import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_manager/api_manager.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../data_sources/remote_auth_data_source.dart';
import '../models/requests/sign_up_request_model.dart';
import '../models/responses/sign_up_response_model.dart';

@Injectable(as: RemoteAuthDataSource)
class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  RemoteAuthDataSourceImpl(this._apiManager);

  @override
  Future<ApiResult<SignUpResponseModel?>> signUp(
      SignUpRequestBodyModel userData) async {
    return await executeApiCall(
      () {
        return _apiManager.register(userData);
      },
    );
  }
}

/*
try {
      final result = await _apiManager.register(userData);
      log('result in remote data source: $result',
          name: 'RemoteAuthDataSourceImpl');
      return Success(result);
    } catch (e) {
      log('error in remote data source: $e', name: 'RemoteAuthDataSourceImpl');
      return Failure(ApiErrorHandler.handle(e));
    }
*/

