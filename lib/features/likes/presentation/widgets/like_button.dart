import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/likes_bloc.dart';
import '../bloc/likes_event.dart';
import '../bloc/likes_state.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  const LikeButton({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikesBloc, LikesState>(
      builder: (context, state) {
        int count = 0;

        if (state is LikesLoaded) {
          count = state.likeCount;
        }

        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.thumb_up_alt_outlined),
              onPressed: () {
                context.read<LikesBloc>().add(ToggleLikeEvent(postId));
              },
            ),
            Text("$count"),
          ],
        );
      },
    );
  }
}
