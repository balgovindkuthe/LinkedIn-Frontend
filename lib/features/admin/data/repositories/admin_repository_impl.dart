import '../../domain/entities/admin_user.dart';
import '../../domain/repositories/admin_repository.dart';
import '../sources/admin_remote_source.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteSource remoteSource;

  AdminRepositoryImpl(this.remoteSource);

  @override
  Future<List<AdminUser>> getAllUsers() {
    return remoteSource.getAllUsers();
  }

  @override
  Future<void> blockUser(int userId) {
    return remoteSource.blockUser(userId);
  }

  @override
  Future<void> unblockUser(int userId) {
    return remoteSource.unblockUser(userId);
  }

  @override
  Future<void> makeAdmin(int userId) {
    return remoteSource.makeAdmin(userId);
  }

  @override
  Future<void> deletePost(int postId) {
    return remoteSource.deletePost(postId);
  }
}
