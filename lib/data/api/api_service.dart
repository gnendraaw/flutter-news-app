import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '6fe9f8753cf54dc5b755602eca23bee6';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(
        "${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load article');
    }
  }
}
