class JwtResponseModel {
  final String accessToken;
  final String refreshToken;
  final String role;

  JwtResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });

  factory JwtResponseModel.fromJson(Map<String, dynamic> json) {
    return JwtResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      role: json['role'] as String,
    );
  }
}
