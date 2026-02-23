import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/create_post.dart';
import '../../domain/usecases/get_feed_posts.dart';
import '../../domain/usecases/get_my_posts.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final CreatePostUseCase createPost;
  final GetFeedPostsUseCase getFeedPosts;
  final GetMyPostsUseCase getMyPosts;

  PostBloc({
    required this.createPost,
    required this.getFeedPosts,
    required this.getMyPosts,
  }) : super(PostInitial()) {
    on<LoadFeedPosts>(_loadFeed);
    on<LoadMyPosts>(_loadMyPosts);
    on<CreatePostEvent>(_createPost);
  }

  Future<void> _loadFeed(event, emit) async {
    emit(PostLoading());
    try {
      final posts = await getFeedPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<void> _loadMyPosts(event, emit) async {
    emit(PostLoading());
    try {
      final posts = await getMyPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<void> _createPost(CreatePostEvent event, emit) async {
    try {
      await createPost(event.content);
      add(LoadFeedPosts());
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
