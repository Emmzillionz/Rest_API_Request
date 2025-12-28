// lib/repository/user_repository.dart
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserRepository {
  final http.Client _client;
  UserRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<List<User>> fetchUsers() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final res = await _client.get(uri);

    if (res.statusCode == 200) {
      return User.listFromJson(res.body);
    } else {
      throw Exception('Failed to load users: ${res.statusCode}');
    }
  }
}
