import '../../domain/entities/admin_user.dart';

abstract class AdminState {}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminLoaded extends AdminState {
  final List<AdminUser> users;
  AdminLoaded(this.users);
}

class AdminError extends AdminState {
  final String message;
  AdminError(this.message);
}
