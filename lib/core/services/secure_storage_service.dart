import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_strings.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  Future<void> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required String role,
  }) async {
    await _storage.write(key: AppStrings.accessToken, value: accessToken);
    await _storage.write(key: AppStrings.refreshToken, value: refreshToken);
    await _storage.write(key: AppStrings.userRole, value: role);
  }

  Future<String?> getAccessToken() {
    return _storage.read(key: AppStrings.accessToken);
  }

  Future<String?> getUserRole() {
    return _storage.read(key: AppStrings.userRole);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
