class ProfileResponse {
  final int userId;
  final String name;
  final String headline;
  final String location;
  final String profileImageUrl;
  final String about;

  ProfileResponse({
    required this.userId,
    required this.name,
    required this.headline,
    required this.location,
    required this.profileImageUrl,
    required this.about,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      userId: json['userId'],
      name: json['name'] ?? '',
      headline: json['headline'] ?? '',
      location: json['location'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      about: json['about'] ?? '',
    );
  }
}