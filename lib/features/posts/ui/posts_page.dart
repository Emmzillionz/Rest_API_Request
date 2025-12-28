import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/features/posts/bloc/posts_bloc.dart';

import '../models/posts_data_ui_model.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users'),backgroundColor: Colors.amber,),
      body: BlocBuilder<PostBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostFetchingSuccessfulState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostBloc>().add( const PostsInitialFetchEvent(refresh: true));
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.posts.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final PostsDataUiModel posts = state.posts[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(posts.id.toString())),
                    title: Text(posts.name),
                    subtitle: Text(posts.userName),
                  );
                },
              ),
            );
          } else if (state is PostsFailure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostBloc>().add( const PostsInitialFetchEvent());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
