import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';
import '../sources/post_remote_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteSource remoteSource;

  PostRepositoryImpl(this.remoteSource);

  @override
  Future<List<PostEntity>> getFeedPosts() {
    return remoteSource.fetchFeedPosts();
  }

  @override
  Future<List<PostEntity>> getMyPosts() {
    return remoteSource.fetchMyPosts();
  }

  @override
  Future<void> createPost(String content) {
    return remoteSource.createPost(content);
  }
}
