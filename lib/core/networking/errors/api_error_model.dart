class ApiErrorModel {
  int? statusCode;
  String? message;
  dynamic data;

  ApiErrorModel({
    this.statusCode,
    required this.message,
    this.data,
  });
}
