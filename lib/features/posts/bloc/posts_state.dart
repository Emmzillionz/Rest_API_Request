part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<PostsDataUiModel> posts;

  const PostFetchingSuccessfulState( this.posts);

  @override
  List<Object?> get props => [posts];
}

class PostsFailure extends PostsState {
  final String message;
  const PostsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
