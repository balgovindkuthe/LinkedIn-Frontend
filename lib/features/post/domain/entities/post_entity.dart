class PostEntity {
  final int id;
  final String content;
  final DateTime createdAt;
  final String username;

  PostEntity({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.username,
  });
}
