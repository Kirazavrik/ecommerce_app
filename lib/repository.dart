import 'dart:convert';

import 'package:ecommerce/home_page/home_page_model.dart';
import 'package:http/http.dart' as http;

class Repository {
   Future<HomePageModel> fetchMainPageData() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'));
    if (response.statusCode == 200) {
      return HomePageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}