import 'dart:convert';

import 'package:http/http.dart' as http;

import '../variables.dart';

class RegisterService {
  static Future<bool> signup(body) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    final response = await http.post('${URLS.BASE_URL}auth/register',
        body: jsonEncode(body), headers: requestHeaders);

    var data = response.body;
    // print(body);
    print(json.decode(data));

    Map<String, dynamic> res_data = jsonDecode(data);
    print(res_data.toString());
    if (res_data['loginstatus'] == 'olduser') {      
      return true;
    } else {
      return false;
    }
    // return false;
  }
}
 