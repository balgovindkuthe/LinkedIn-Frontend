abstract class PostEvent {}

class LoadFeedPosts extends PostEvent {}

class LoadMyPosts extends PostEvent {}

class CreatePostEvent extends PostEvent {
  final String content;
  CreatePostEvent(this.content);
}
