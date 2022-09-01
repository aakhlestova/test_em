import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_em/models/cart_model.dart';
import 'package:test_em/models/main_screen_model.dart';
import 'package:test_em/models/product_details_model.dart';

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

  static Future<ProductDetails?> fetchProductDetailsData() async {
    var response = await client.get(Uri.parse(
        'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productDetailsFromJson(jsonString);
    } else {
      return  null;
    }
  }

  static Future<Cart?> fetchCartData() async {
    var response = await client.get(Uri.parse(
        'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cartFromJson(jsonString);
    } else {
      return  null;
    }
  }
}
