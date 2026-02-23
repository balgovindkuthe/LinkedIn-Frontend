abstract class LikesEvent {}

class ToggleLikeEvent extends LikesEvent {
  final int postId;
  ToggleLikeEvent(this.postId);
}

class LoadLikeCountEvent extends LikesEvent {
  final int postId;
  LoadLikeCountEvent(this.postId);
}
