abstract class LikesState {}

class LikesInitial extends LikesState {}

class LikesLoading extends LikesState {}

class LikesLoaded extends LikesState {
  final int likeCount;
  LikesLoaded(this.likeCount);
}

class LikesError extends LikesState {
  final String message;
  LikesError(this.message);
}
