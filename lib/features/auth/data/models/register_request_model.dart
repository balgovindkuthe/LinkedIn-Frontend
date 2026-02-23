class RegisterRequestModel {
  final String username;
  final String email;
  final String password;
  final String roles;

  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
    this.roles = "ROLE_USER",
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "password": password,
      "roles": roles,
    };
  }
}
