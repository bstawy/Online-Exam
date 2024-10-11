import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

/// A data model class that represents the response object
/// received from the server after a successful sign-in request.
/// This class contains the token returned by the server.
///
/// The `token` field is essential for authenticated requests
/// and is typically stored securely after sign-in.
@JsonSerializable()
class SignInResponse {
  /// The authentication token returned by the server after
  /// a successful sign-in.
  /// This token will be used in subsequent API requests to identify
  /// the user and allow access to protected routes.
  @JsonKey(name: 'token')
  final String token;

  /// Constructor for creating a [SignInResponse].
  /// Requires a [token] which is returned by the API after sign-in.
  SignInResponse({required this.token});

  /// Factory constructor for creating a new instance from a JSON object.
  /// Takes a JSON map and returns an instance of [SignInResponse].
  /// This method is typically used when receiving data from an API.
  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  /// Converts the current instance of [SignInResponse] into a JSON map.
  /// This method is used to serialize the object when sending it
  /// to other parts of the application.
  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
