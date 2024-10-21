import '../user_model.dart';

class SignUpResponseModel {
  String? message;
  String? token;
  UserModel? user;

  SignUpResponseModel({
    this.message,
    this.token,
    this.user,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      message: json['message'],
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
