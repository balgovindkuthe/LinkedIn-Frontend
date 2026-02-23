class ApiConstants {
  static const String baseUrl = "http://localhost:8080";

  static const String login = "/api/auth/login";
  static const String register = "/api/auth/register";

  static const String createPost = "/api/posts/create";
  static const String myPosts = "/api/posts/me";
  static const String feedPosts = "/api/posts/feed";

  static const String like = '/api/likes';
  static const String likeCount = '/api/likes';

  static const String adminUsers = '/api/admin/users';
  static const String blockUser = '/api/admin/block';
  static const String unblockUser = '/api/admin/unblock';
  static const String deletePostByAdmin = '/api/admin/post';

}

