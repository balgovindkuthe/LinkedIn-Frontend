import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';
import '../sources/auth_remote_data_source.dart';
import '../../../../core/services/token_service.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenService tokenService;

  AuthRepositoryImpl({required this.remoteDataSource,
  required this.tokenService,
  });


  @override
  Future<String> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final request = RegisterRequestModel(
      username: username,
      email: email,
      password: password,
    );

    final response = await remoteDataSource.register(request);
    return response;
  }

  @override
  Future<User> login({
    required String username,
    required String password,
  }) async {
    final request = LoginRequestModel(
      username: username,
      password: password,
    );

    final jwtResponse = await remoteDataSource.login(request);

    await tokenService.saveLoginData(
      accessToken: jwtResponse.accessToken,
      refreshToken: jwtResponse.refreshToken,
      role: jwtResponse.role,
    );

    return User(
      accessToken: jwtResponse.accessToken,
      refreshToken: jwtResponse.refreshToken,
      role: jwtResponse.role,
    );
  }
}
