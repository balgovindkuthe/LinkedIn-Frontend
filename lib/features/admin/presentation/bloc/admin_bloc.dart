import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/admin_repository.dart';
import 'admin_event.dart';
import 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepository repository;

  AdminBloc(this.repository) : super(AdminInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(AdminLoading());
      try {
        final users = await repository.getAllUsers();
        emit(AdminLoaded(users));
      } catch (e) {
        emit(AdminError(e.toString()));
      }
    });

    on<BlockUserEvent>((event, emit) async {
      await repository.blockUser(event.userId);
      add(LoadUsers());
    });

    on<UnblockUserEvent>((event, emit) async {
      await repository.unblockUser(event.userId);
      add(LoadUsers());
    });

    on<MakeAdminEvent>((event, emit) async {
      await repository.makeAdmin(event.userId);
      add(LoadUsers());
    });
  }
}
