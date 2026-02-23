
import '../entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getFeedPosts();
  Future<List<PostEntity>> getMyPosts();
  Future<void> createPost(String content);
}
