// lib/bloc/user/user_event.dart
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object?> get props => [];
}

class LoadUsers extends UserEvent {
  final bool refresh;
  const LoadUsers({this.refresh = false});

  @override
  List<Object?> get props => [refresh];
}
