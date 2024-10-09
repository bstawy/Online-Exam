import 'api_result.dart';
import 'errors/api_error_handler.dart';

Future<ApiResult<T>> executeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall.call();
    return Success(result);
  } catch (e) {
    return Failure(ApiErrorHandler.handle(e));
  }
}
