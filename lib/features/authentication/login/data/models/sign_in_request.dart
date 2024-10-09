import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

/// A data model class that represents the request object
/// for signing in a user.
/// This class will be converted to JSON format before being sent
/// to the server.
///
/// The `email` and `password` fields are required, and they
/// should be provided in the API request. The field annotations
/// ensure correct mapping between Dart fields and the JSON keys.
@JsonSerializable()
class SignInRequest {
  /// The user's email address.
  /// This will be sent in the API request as a part of the sign-in process.
  /// It should be in a valid email format.
  @JsonKey(name: 'email')
  final String email;

  /// The user's password.
  /// This field contains the password needed for authentication.
  /// The password is required and will be sent in the API request.
  @JsonKey(name: 'password')
  final String password;

  /// Constructor for creating a [SignInRequest].
  /// Requires both [email] and [password] to be passed in.
  SignInRequest({required this.email, required this.password});

  /// Factory constructor for creating a new instance from a JSON object.
  /// Takes a JSON map and returns an instance of [SignInRequest].
  /// This method is typically used when receiving data from an API or local storage.
  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  /// Converts the current instance of [SignInRequest] into a JSON map.
  /// This method is used to serialize the object when sending it
  /// to the API as a part of the request body.
  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
