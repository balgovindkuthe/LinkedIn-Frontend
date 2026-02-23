import '../entities/user.dart';

abstract class AuthRepository {
  Future<String> register({
    required String username,
    required String email,
    required String password,
  });

  Future<User> login({
    required String username,
    required String password,
  });
}
