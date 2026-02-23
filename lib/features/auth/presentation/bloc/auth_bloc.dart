import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../../../core/services/token_service.dart';
import '../../../../di/service_locator.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final TokenService tokenService;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.tokenService,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onLogin(
      LoginEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final user = await loginUseCase(
        username: event.username,
        password: event.password,
      );

      await sl<TokenService>().saveLoginData(
        accessToken: user.accessToken,
        refreshToken: user.refreshToken,
        role: user.role,
      );

      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(const AuthError("Login failed"));
    }
  }

  Future<void> _onRegister(
      RegisterEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final message = await registerUseCase(
        username: event.username,
        email: event.email,
        password: event.password,
      );

      emit(AuthRegistered(message));
    } catch (e) {
      emit(const AuthError("Registration failed"));
    }
  }
}
