import 'errors/api_error_model.dart';

sealed class ApiResult<T> {}

class Success<T> implements ApiResult<T> {
  T data;
  Success(this.data);
}

class Failure<T> implements ApiResult<T> {
  ApiErrorModel apiErrorModel;
  Failure(this.apiErrorModel);
}
