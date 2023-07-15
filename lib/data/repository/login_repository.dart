import 'dart:convert';

import 'package:login_page/data/models/login.dart';
import 'package:http/http.dart' as http;

Future<LoginResponse?> login(
    {required String user, required String password}) async {
  const String baseUrl = 'https://dummyjson.com';

  var body = jsonEncode({'username': user, 'password': password});

  final response = await http.post(
    Uri.parse('$baseUrl/auth/login'),
    headers: {'Content-Type': 'application/json'},
    body: body,
  );
  print(body);
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(
      'Erro durante o login: ${response.statusCode}${response.body}',
    );
  }
}
