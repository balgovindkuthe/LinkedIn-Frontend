import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';
import '../models/jwt_response_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<String> register(RegisterRequestModel request) async {
    final response = await dio.post(
      ApiConstants.register,
      data: request.toJson(),
    );

    return response.data.toString();
  }

  @override
  Future<JwtResponseModel> login(LoginRequestModel request) async {
    final response = await dio.post(
      ApiConstants.login,
      data: request.toJson(),
    );

    return JwtResponseModel.fromJson(response.data);
  }
}
