class AdminUser {
  final int id;
  final String name;
  final String email;
  final bool blocked;
  final String role;

  AdminUser({
    required this.id,
    required this.name,
    required this.email,
    required this.blocked,
    required this.role,
  });
}
