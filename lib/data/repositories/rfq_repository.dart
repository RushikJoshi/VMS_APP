import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vms_app/data/repositories/auth_repository.dart';
// import '../services/auth_service.dart';

class RfqRepository {
  static const String baseUrl =
      'https://gprocurenet.gitakshmi.com/api/v1';

  final AuthService _authService = AuthService();//object
//create function
  Future<dynamic> getRfqList() async {
    try {
      final token = await _authService.getToken();//token

      final response = await http.get(
        Uri.parse('$baseUrl/rfqs'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(
          data['message'] ?? 'Failed to fetch RFQ data',
        );
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}