import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';

class LikesRemoteSource {
  final ApiClient apiClient;

  LikesRemoteSource(this.apiClient);

  Future<String> likeOrUnlikePost(int postId) async {
    final response =
    await apiClient.post("${ApiConstants.like}/$postId");
    return response.data as String;
  }

  Future<int> getLikeCount(int postId) async {
    final response =
    await apiClient.get("${ApiConstants.like}/$postId/count");
    return response.data as int;
  }
}
