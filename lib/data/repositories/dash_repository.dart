import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vms_app/data/repositories/auth_repository.dart';
import '../models/admin_stats_model.dart';

class AdminService {
  static const String baseUrl = 'https://gprocurenet.gitakshmi.com/api/v1';

  final AuthService _authService = AuthService();

  Future<AdminStatsResponse?> getAdminStats() async {
    final url = Uri.parse('$baseUrl/admin/stats');

    try {
      final token = await _authService.getToken();

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print("STATUS CODE : ${response.statusCode}");
      print("RESPONSE : ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return AdminStatsResponse.fromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      print("ERROR : $e");
      return null;
    }
  }
}