import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //base url

  static const String baseUrl = 'https://gprocurenet.gitakshmi.com/api';

  //storage key   SharedPreferences data save name=====

  static const String tokenKey = 'auth_token'; //save token
  static const String userKey = 'user_data';   // save user detail

  //login function//

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/auth/login');

    //try catch//

    try {

      //post api call//

      final response = await http.post(
        url,

        //header//

        headers: {
          'Content-Type': 'application/json',

        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
    //response//
      print('========================LOGIN STATUS: ${response.statusCode}===============================');
      print('================LOGIN BODY: ${response.body}====================================');
    //decode response//
      final data = jsonDecode(response.body);
   // check status code //
      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = data['token'] ?? data['data']?['token'];

        if (token != null) {
          await saveToken(token);
        }
        await saveUserData(data);
        return {
          'success': true,
          'message': data['message'] ?? 'Login successful',
          'data': data,
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Login error: $e',
      };
    }
  }
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  Future<void> saveUserData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(data));
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(userKey);

    if (userString == null) return null;

    return jsonDecode(userString);
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
    await prefs.remove(userKey);
  }
}