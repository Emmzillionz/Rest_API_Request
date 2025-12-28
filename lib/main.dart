// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/user/user_bloc.dart';
import 'bloc/user/user_event.dart';
import 'repository/user_repository.dart';
import 'screens/user_screen.dart';

void main() {
  final repo = UserRepository();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => UserBloc(repo)..add(const LoadUsers(),),)
  ], child: MyApp(repo: repo)));
}

class MyApp extends StatelessWidget {
  final UserRepository repo;

  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter BLoC API Demo',
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}
