import 'dart:convert';

class PostsDataUiModel {
  final int id;
  final String name;
  final String userName;

  PostsDataUiModel({
    required this.id,
    required this.name,
    required this.userName,
  });

  // factory PostsDataUiModel.fromJson(Map<String, dynamic> json) => PostsDataUiModel(
  //   id: json["id"],
  //   quote: json["quote"],
  //   author: json["author"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "quote": quote,
  //   "author": author,
  // };

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'quote': quote,
  //     'author': author,
  //   };
  // }

  factory PostsDataUiModel.fromJson(Map<String, dynamic> json) {
    return PostsDataUiModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
    );
  }

  static List<PostsDataUiModel> listFromJson(String body) {
    final List<dynamic> data = jsonDecode(body) as List<dynamic>;
    return data
        .map((e) => PostsDataUiModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
// String toJson() => json.encode(toMap());
//
// factory PostsDataUiModel.fromJson(String source) =>
//     PostsDataUiModel.fromMap(json.decode(source));
}
