sealed class ApiResult<T> {}

class Success<T> implements ApiResult<T> {
  T data;
  Success(this.data);
}

class Failure<T> implements ApiResult<T> {
  Exception exception;
  Failure(this.exception);
}
