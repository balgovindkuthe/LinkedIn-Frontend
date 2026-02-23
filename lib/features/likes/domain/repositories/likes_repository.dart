abstract class LikesRepository {
  Future<String> likeOrUnlikePost(int postId);
  Future<int> getLikeCount(int postId);
}
