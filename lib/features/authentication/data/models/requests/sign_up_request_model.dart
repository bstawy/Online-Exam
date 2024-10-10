class SignUpRequestBodyModel {
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;

  SignUpRequestBodyModel({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "rePassword": confirmPassword,
      "phone": phone,
    };
  }
}
