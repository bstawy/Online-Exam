class SignUpResponseModel {
  String? message;
  String? token;

  SignUpResponseModel({
    this.message,
    this.token,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      message: json['message'],
      token: json['token'],
    );
  }
}
