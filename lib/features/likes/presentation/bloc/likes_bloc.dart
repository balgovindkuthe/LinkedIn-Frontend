import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/likes_repository.dart';
import 'likes_event.dart';
import 'likes_state.dart';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  final LikesRepository repository;

  LikesBloc(this.repository) : super(LikesInitial()) {
    on<ToggleLikeEvent>(_toggleLike);
    on<LoadLikeCountEvent>(_loadLikeCount);
  }

  Future<void> _toggleLike(
      ToggleLikeEvent event, Emitter<LikesState> emit) async {
    try {
      await repository.likeOrUnlikePost(event.postId);
      final count = await repository.getLikeCount(event.postId);
      emit(LikesLoaded(count));
    } catch (e) {
      emit(LikesError(e.toString()));
    }
  }

  Future<void> _loadLikeCount(
      LoadLikeCountEvent event, Emitter<LikesState> emit) async {
    try {
      final count = await repository.getLikeCount(event.postId);
      emit(LikesLoaded(count));
    } catch (e) {
      emit(LikesError(e.toString()));
    }
  }
}
