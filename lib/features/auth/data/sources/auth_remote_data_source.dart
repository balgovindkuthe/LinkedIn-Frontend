import '../models/login_request_model.dart';
import '../models/register_request_model.dart';
import '../models/jwt_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> register(RegisterRequestModel request);

  Future<JwtResponseModel> login(LoginRequestModel request);
}

