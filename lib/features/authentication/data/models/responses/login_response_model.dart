class LoginResponseModel {
  String? message;
  String? token;

  LoginResponseModel({
    this.message,
    this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      token: json['token'],
    );
  }
}
