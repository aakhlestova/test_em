import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_em/models/main_screen_model.dart';

class Repository {
  static var client = http.Client();

  static Future<MainScreen?> fetchMainScreenData() async {
    var response = await client.get(Uri.parse(
        'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return mainScreenFromJson(jsonString);
    } else {
      return  null;
    }
  }
}
