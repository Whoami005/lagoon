import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lagoon/models/posts.dart';
import 'package:lagoon/repositories/auth.dart';

class PostsRepository {
  Uri url = Uri.parse('http://31.41.155.125/posts/recommend');

  Future fetchPosts() async {
    final token = await AuthRepository().logIn();
    final response = await http.get(url, headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      final resultJson = jsonDecode(response.body);
      final List<Data> result = [];

      for (final map in resultJson["data"]) {
        result.add(Data.fromJson(map));
      }
      return result;
    } else {
      final resultJson = jsonDecode(response.body);
      return throw Exception(resultJson['message']);
    }
  }
}
