import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';
import '../../domain/entities/post_entity.dart';
import 'create_post_sheet.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(LoadFeedPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                builder: (_) => BlocProvider.value(
                  value: context.read<PostBloc>(),
                  child: const CreatePostSheet(),
                ),
              );
            },
          ),
        ],
      ),

      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PostError) {
            return Center(child: Text(state.message));
          }

          if (state is PostLoaded) {
            if (state.posts.isEmpty) {
              return const Center(child: Text('Loading'));
            }

            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final PostEntity post = state.posts[index];
                return _PostCard(post: post);
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final PostEntity post;

  const _PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(post.content),
            const SizedBox(height: 8),
            Text(
              post.createdAt.toLocal().toString(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
