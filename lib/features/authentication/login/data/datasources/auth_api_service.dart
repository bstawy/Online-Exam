import 'package:dio/dio.dart';
import 'package:online_exam/features/authentication/login/data/models/sign_in_request.dart';
import 'package:online_exam/features/authentication/login/data/models/sign_in_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

/// Defines the API service for authentication-related requests.
/// This service communicates with a remote API to handle user sign-ins.
///
/// The base URL for the API is "https://exam.elevateegy.com/api/v1",
/// and this service includes an endpoint for the sign-in operation.
@RestApi(baseUrl: "https://exam.elevateegy.com/api/v1")
abstract class AuthApiService {
  /// Factory constructor for creating an instance of [AuthApiService].
  /// Takes a [Dio] object for making HTTP requests and an optional [baseUrl].
  /// The [Dio] object can be customized to add interceptors or handle different
  /// network configurations.
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// Sends a POST request to the "/auth/signin" endpoint to sign in a user.
  /// This method requires a [SignInRequest] object, which contains the user's
  /// email and password, and it returns a [SignInResponse] containing the
  /// authentication token.
  ///
  /// The [SignInRequest] object is sent in the body of the request and is serialized
  /// to JSON format automatically.
  ///
  /// This is an asynchronous operation and returns a `Future` of [SignInResponse].
  /// Once the operation completes, the sign-in token can be accessed from the response.
  @POST("/auth/signin")
  Future<SignInResponse> signIn(@Body() SignInRequest request);
}
