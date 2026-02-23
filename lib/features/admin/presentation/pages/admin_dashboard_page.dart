import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/admin_bloc.dart';
import '../bloc/admin_event.dart';
import '../bloc/admin_state.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          if (state is AdminLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AdminLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!user.blocked)
                        IconButton(
                          icon: const Icon(Icons.block),
                          onPressed: () {
                            context.read<AdminBloc>()
                                .add(BlockUserEvent(user.id));
                          },
                        ),
                      if (user.blocked)
                        IconButton(
                          icon: const Icon(Icons.lock_open),
                          onPressed: () {
                            context.read<AdminBloc>()
                                .add(UnblockUserEvent(user.id));
                          },
                        ),
                    ],
                  ),
                );
              },
            );
          }

          if (state is AdminError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
