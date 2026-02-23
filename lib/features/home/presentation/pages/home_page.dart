import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:linkedin_frontend/features/home/presentation/widgets/top_search_bar.dart';
import 'package:linkedin_frontend/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:linkedin_frontend/features/home/presentation/widgets/home_app_bar.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../../../presentation/widgets/post_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          const TopSearchBar(),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is HomeError) {
                  return Center(child: Text(state.message));
                }

                if (state is HomeLoaded) {
                  if (state.posts.isEmpty) {
                    return const Center(child: Text("Loading"));
                  }
                  return PostList(posts: state.posts);
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
