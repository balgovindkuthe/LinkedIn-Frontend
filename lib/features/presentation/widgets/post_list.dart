import 'package:flutter/material.dart';
import '../../post/domain/entities/post_entity.dart';
import 'post_card.dart';

class PostList extends StatelessWidget {
  final List<PostEntity> posts;

  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(post: posts[index]);
      },
    );
  }
}
