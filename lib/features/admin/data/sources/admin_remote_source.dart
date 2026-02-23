import 'package:dio/dio.dart';
import '../models/admin_user_model.dart';

class AdminRemoteSource {
  final Dio dio;

  AdminRemoteSource(this.dio);

  Future<List<AdminUserModel>> getAllUsers() async {
    final response = await dio.get('/api/admin/users');
    return (response.data as List)
        .map((e) => AdminUserModel.fromJson(e))
        .toList();
  }

  Future<void> blockUser(int userId) async {
    await dio.put('/api/admin/block/$userId');
  }

  Future<void> unblockUser(int userId) async {
    await dio.put('/api/admin/unblock/$userId');
  }

  Future<void> makeAdmin(int userId) async {
    await dio.put('/api/admin/make-admin/$userId');
  }

  Future<void> deletePost(int postId) async {
    await dio.delete('/api/admin/post/$postId');
  }
}
