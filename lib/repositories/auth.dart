import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  final String _server = 'http://31.41.155.125';
  String? _accessToken;

  String? get accessToken => _accessToken;

  Future<String> logIn() async {
    Uri url = Uri.parse("$_server/auth/signin");
    final result = await http
        .post(url, body: {"user": "kad1199@mail.ru", "password": "123456789"});
    if (result.statusCode == 201) {
      final jsonResult = jsonDecode(result.body);
      _accessToken = jsonResult['data']['access_token'];

      return _accessToken!;
    } else {
      return 'Ошибка сервера';
    }
  }
}
