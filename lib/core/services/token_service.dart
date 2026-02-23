import 'secure_storage_service.dart';

class TokenService {
  final SecureStorageService storageService;

  TokenService(this.storageService);


  Future<void> saveLoginData({
    required String accessToken,
    required String refreshToken,
    required String role,
  }) async {
    await storageService.saveAuthData(
      accessToken: accessToken,
      refreshToken: refreshToken,
      role: role,
    );
  }


  Future<bool> isLoggedIn() async {
    final token = await storageService.getAccessToken();
    return token != null && token.isNotEmpty;
  }


  Future<String?> getUserRole() async {
    return await storageService.getUserRole();
  }

  Future<void> logout() async {
    await storageService.clear();
  }
}
