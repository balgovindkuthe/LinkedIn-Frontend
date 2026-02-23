import '../entities/admin_user.dart';

abstract class AdminRepository {
  Future<List<AdminUser>> getAllUsers();
  Future<void> blockUser(int userId);
  Future<void> unblockUser(int userId);
  Future<void> makeAdmin(int userId);
  Future<void> deletePost(int postId);
}
