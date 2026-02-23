import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/service_locator.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/post/presentation/bloc/post_bloc.dart';
import 'features/post/presentation/bloc/post_event.dart';
import '../../../features/home/presentation/pages/home_page.dart';

import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'app/app_routes.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LinkedIn",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        AppRoutes.login: (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const LoginPage(),
        ),
        AppRoutes.register: (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const RegisterPage(),
        ),

        AppRoutes.home: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (_) => sl<HomeBloc>(),
            ),
            BlocProvider<PostBloc>(
              create: (_) => sl<PostBloc>()..add(LoadFeedPosts()),
            ),
          ],
          child: const HomePage(),
        ),
      },
      initialRoute: AppRoutes.login,
    );
  }
}
