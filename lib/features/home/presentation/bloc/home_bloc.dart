import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../post/domain/repositories/post_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostRepository postRepository;

  HomeBloc({required this.postRepository}) : super(HomeInitial()) {
    on<LoadHomePosts>(_onLoadHomePosts);
    add(LoadHomePosts());
  }

  Future<void> _onLoadHomePosts(
      LoadHomePosts event,
      Emitter<HomeState> emit,
      ) async {
    emit(HomeLoading());
    try {
      final posts = await postRepository.getFeedPosts();
      emit(HomeLoaded(posts: posts));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
