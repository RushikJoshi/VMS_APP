import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vms_app/data/models/admin_vendor_list_model.dart' show VendorListResponse;
import 'auth_repository.dart';


class VendorListRepository {


  static const String baseUrl =
      'https://gprocurenet.gitakshmi.com/api/v1';


  final AuthService _authService = AuthService();


  Future<VendorListResponse?> getVendors({
    int page = 1,
    int limit = 10,
  }) async {

    try{

      final token = await _authService.getToken();


      final url = Uri.parse(
          '$baseUrl/admin/vendors?page=$page&limit=$limit'
      );


      final response = await http.get(
        url,
        headers: {
          'Authorization':'Bearer $token',
          'Content-Type':'application/json',
        },
      );


      print(response.body);


      if(response.statusCode==200){

        final jsonData=jsonDecode(response.body);

        return VendorListResponse.fromJson(jsonData); //response model file

      }
      print('========================LOGIN STATUS: ${response.statusCode}===============================');


      return null;


    }catch(e){

      print(e);

      return null;

    }

  }

}