import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class GetFeedPostsUseCase {
  final PostRepository repository;

  GetFeedPostsUseCase(this.repository);

  Future<List<PostEntity>> call() {
    return repository.getFeedPosts();
  }
}
