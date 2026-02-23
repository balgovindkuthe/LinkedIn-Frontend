import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/token_service.dart';
import '../../../di/service_locator.dart';
import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/auth/presentation/pages/login_page.dart';
import '../../app/app_routes.dart';
import '../../features/admin/presentation/pages/admin_dashboard_page.dart';
import '../constants/role_constants.dart';

class RouteGuard {
  static Future<Route<dynamic>> guard(RouteSettings settings) async {
    final tokenService = sl<TokenService>();

    final isLoggedIn = await tokenService.isLoggedIn();
    final role = await tokenService.getUserRole();

    if (!isLoggedIn) {
      return _page(const LoginPage());
    }

    if (settings.name == AppRoutes.admin &&
        role != RoleConstants.admin) {
      return _homeWithBloc();
    }

    if (settings.name == AppRoutes.home &&
        role == RoleConstants.admin) {
      return _page(const AdminDashboardPage());
    }

    if (settings.name == AppRoutes.home) {
      return _homeWithBloc();
    }

    return MaterialPageRoute(
      builder: (_) => settings.arguments as Widget,
    );
  }

  static Route<dynamic> _homeWithBloc() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<HomeBloc>(
        create: (_) => sl<HomeBloc>(),
        child: const HomePage(),
      ),
    );
  }

  static Route<dynamic> _page(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
