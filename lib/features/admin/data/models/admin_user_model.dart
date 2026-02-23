import '../../domain/entities/admin_user.dart';

class AdminUserModel extends AdminUser {
  AdminUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.blocked,
    required super.role,
  });

  factory AdminUserModel.fromJson(Map<String, dynamic> json) {
    return AdminUserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      blocked: json['blocked'],
      role: json['role'],
    );
  }
}
