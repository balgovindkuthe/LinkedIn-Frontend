import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../core/constants/api_constants.dart';
import '../core/network/api_client.dart';
import '../core/network/interceptor.dart';
import '../core/services/secure_storage_service.dart';
import '../core/services/token_service.dart';

// AUTH
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/data/sources/auth_remote_data_source.dart';
import '../features/auth/data/sources/auth_remote_data_source_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/domain/usecases/register_usecase.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

// HOME
import '../features/home/presentation/bloc/home_bloc.dart';

// POST
import '../features/post/data/repositories/post_repository_impl.dart';
import '../features/post/data/sources/post_remote_source.dart';
import '../features/post/domain/repositories/post_repository.dart';
import '../features/post/domain/usecases/create_post.dart';
import '../features/post/domain/usecases/get_feed_posts.dart';
import '../features/post/domain/usecases/get_my_posts.dart';
import '../features/post/presentation/bloc/post_bloc.dart';

// PROFILE ✅ (ONLY ADDITION)
import '../features/profile/data/datasources/profile_remote_datasource.dart';
import '../features/profile/data/repositories/profile_repository_impl.dart';
import '../features/profile/domain/repositories/profile_repository.dart';
import '../features/profile/domain/usecases/get_my_profile.dart';
import '../features/profile/domain/usecases/update_profile.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {


  sl.registerLazySingleton(() => const FlutterSecureStorage());

  sl.registerLazySingleton(
        () => SecureStorageService(sl()),
  );

  sl.registerLazySingleton(
        () => TokenService(sl()),
  );

  sl.registerLazySingleton(() => JwtInterceptor(
    secureStorage: sl(),
  ));

  sl.registerLazySingleton(() => Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  )..interceptors.add(sl<JwtInterceptor>()));

  sl.registerLazySingleton(() => ApiClient(sl<Dio>()));


  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      tokenService: sl(),
    ),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  sl.registerFactory(
        () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      tokenService: sl(),
    ),
  );


  sl.registerFactory<HomeBloc>(
        () => HomeBloc(postRepository: sl()),
  );


  sl.registerLazySingleton(() => PostRemoteSource());

  sl.registerLazySingleton<PostRepository>(
        () => PostRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => CreatePostUseCase(sl()));
  sl.registerLazySingleton(() => GetFeedPostsUseCase(sl()));
  sl.registerLazySingleton(() => GetMyPostsUseCase(sl()));

  sl.registerFactory(
        () => PostBloc(
      createPost: sl(),
      getFeedPosts: sl(),
      getMyPosts: sl(),
    ),
  );


  sl.registerLazySingleton(
        () => ProfileRemoteDatasource(sl<Dio>()),
  );

  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => GetMyProfile(sl()));
  sl.registerLazySingleton(() => UpdateProfile(sl()));

  sl.registerFactory(
        () => ProfileBloc(
      sl(),
      sl(),
    ),
  );

}