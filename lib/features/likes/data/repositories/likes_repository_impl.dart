import '../../domain/repositories/likes_repository.dart';
import '../sources/likes_remote_source.dart';

class LikesRepositoryImpl implements LikesRepository {
  final LikesRemoteSource remoteSource;

  LikesRepositoryImpl(this.remoteSource);

  @override
  Future<String> likeOrUnlikePost(int postId) {
    return remoteSource.likeOrUnlikePost(postId);
  }

  @override
  Future<int> getLikeCount(int postId) {
    return remoteSource.getLikeCount(postId);
  }
}
