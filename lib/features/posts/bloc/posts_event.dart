part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override List<Object?> get props => [];
}

class PostsInitialFetchEvent extends PostsEvent {
  final bool refresh;

  const PostsInitialFetchEvent({this.refresh = false});

  @override List<Object?> get props => [refresh];
}

