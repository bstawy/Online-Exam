import '../user_model.dart';

class LoginResponseModel {
  String? message;
  String? token;
  UserModel? user;

  LoginResponseModel({
    this.message,
    this.token,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
