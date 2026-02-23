import 'package:dio/dio.dart';
import '../models/profile_response.dart';

class ProfileRemoteDatasource {
  final Dio dio;

  ProfileRemoteDatasource(this.dio);

  Future<ProfileResponse> getMyProfile() async {
    final response = await dio.get('/api/profile/me');
    return ProfileResponse.fromJson(response.data);
  }

  Future<ProfileResponse> updateProfile(Map<String, dynamic> body) async {
    final response = await dio.put('/api/profile/me', data: body);
    return ProfileResponse.fromJson(response.data);
  }
}