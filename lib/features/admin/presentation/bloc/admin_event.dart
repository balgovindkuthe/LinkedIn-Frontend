abstract class AdminEvent {}

class LoadUsers extends AdminEvent {}

class BlockUserEvent extends AdminEvent {
  final int userId;
  BlockUserEvent(this.userId);
}

class UnblockUserEvent extends AdminEvent {
  final int userId;
  UnblockUserEvent(this.userId);
}

class MakeAdminEvent extends AdminEvent {
  final int userId;
  MakeAdminEvent(this.userId);
}
