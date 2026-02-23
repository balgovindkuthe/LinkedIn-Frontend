import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class GetMyPostsUseCase {
  final PostRepository repository;

  GetMyPostsUseCase(this.repository);

  Future<List<PostEntity>> call() {
    return repository.getMyPosts();
  }
}
