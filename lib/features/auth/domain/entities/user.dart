class User {
  final String accessToken;
  final String refreshToken;
  final String role;

  User({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });
}
