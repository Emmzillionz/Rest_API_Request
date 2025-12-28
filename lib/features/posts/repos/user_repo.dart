// lib/repository/user_repository.dart
import 'package:http/http.dart' as http;
import 'package:rest_api/features/posts/models/posts_data_ui_model.dart';

class UserRepository {
  final http.Client _client;
  UserRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<List<PostsDataUiModel>> fetchUsers() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final res = await _client.get(uri);

    if (res.statusCode == 200) {
      return PostsDataUiModel.listFromJson(res.body);
    } else {
      throw Exception('Failed to load users: ${res.statusCode}');
    }
  }
}
