import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:rest_api/features/posts/models/posts_data_ui_model.dart';

import '../repos/user_repo.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostBloc extends Bloc<PostsEvent, PostsState> {
  final UserRepository _repo;

  PostBloc(this._repo) : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      final posts = await _repo.fetchUsers();
      emit(PostFetchingSuccessfulState(posts));
    } catch (e) {
      emit(PostsFailure(e.toString()));
    }
  }
}
