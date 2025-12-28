// lib/bloc/user/user_state.dart
import 'package:equatable/equatable.dart';
import '../../models/user.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<User> users;
  const UserSuccess(this.users);

  @override
  List<Object?> get props => [users];
}

class UserFailure extends UserState {
  final String message;
  const UserFailure(this.message);

  @override
  List<Object?> get props => [message];
}
