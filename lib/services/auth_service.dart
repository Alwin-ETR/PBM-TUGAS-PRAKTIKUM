import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import 'storage_service.dart';

class AuthService {
  static Future<bool> login({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse(
      "${Constants.baseUrl}/api/auth/login",
    );

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final token = data['data']['token'];

      await StorageService.saveToken(token);

      return true;
    }

    return false;
  }
}