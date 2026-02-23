import '../../domain/entities/post_entity.dart';

class PostRemoteSource {
  final List<PostEntity> _posts = [];

  Future<List<PostEntity>> fetchFeedPosts() async {
    return _posts;
  }

  Future<List<PostEntity>> fetchMyPosts() async {
    return _posts.where((p) => p.username == 'Me').toList();
  }

  Future<void> createPost(String content) async {
    _posts.insert(
      0,
      PostEntity(
        id: DateTime.now().millisecondsSinceEpoch,
        content: content,
        createdAt: DateTime.now(),
        username: 'Me',
      ),
    );
  }
}
