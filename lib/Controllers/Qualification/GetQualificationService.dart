import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nsbm_ipt/Modals/QualificationModal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../variables.dart';

class GetQService {
  static Future<List<dynamic>> getQs() async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

      SharedPreferences login = await SharedPreferences.getInstance();
      
      var token = login.getString("gettoken");

      

      final response = await http.get('${URLS.BASE_URL}qualification/getstdqtoken/$token',
           headers: requestHeaders);

      if (response.statusCode == 200) {
        List<QualificationItem> list = parseInterests(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static List<QualificationItem> parseInterests(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<QualificationItem>((json) => QualificationItem.fromJson(json)).toList();
  }
}