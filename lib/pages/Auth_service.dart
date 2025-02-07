import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://10.0.2.2:8000/api';
  // Ganti IP sesuai dengan IP perangkat Anda jika menggunakan perangkat fisik

  // Method untuk register
  Future<void> registerUser(String name, String email, String password) async {
    final String url = '$baseUrl/register';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Register berhasil: ${response.body}');
      } else {
        print('Gagal register dengan status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Kesalahan saat menghubungi server: $e');
    }
  }

  // Method untuk login
  Future<void> loginUser(String email, String password) async {
    final String url = '$baseUrl/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Login berhasil, token: ${data['token']}');
      } else {
        print('Gagal login dengan status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat login: $e');
    }
  }
}
