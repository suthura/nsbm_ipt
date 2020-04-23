import 'dart:convert';

import 'package:http/http.dart' as http;

import '../variables.dart';

class DelQualificationService {
  static Future<bool> delete(id) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    final response = await http.delete('${URLS.BASE_URL}qualification/removeqparam/$id',
         headers: requestHeaders);

    var data = response.body;
    // print(body);
    print(json.decode(data));

    Map<String, dynamic> res_data = jsonDecode(data);
    print(res_data.toString());
    if (res_data['message'] == 'success') {      
      return true;
    } else {
      return false;
    }
    // return false;
  }
}