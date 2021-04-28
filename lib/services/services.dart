import 'package:dio/dio.dart';
import 'package:mvvmprac/const/keys.dart';
import 'package:mvvmprac/models/newsArticle.dart';

class WebServices {
  var dio = Dio();

  Future<List<NewsArticle>> fetchData() async {
    final response = await dio.get(Constants.TOPHEADLINES);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("RESPONSE FAILED");
    }
  }

  Future<List<NewsArticle>> fetchDataByCountry(String country) async {
    final response = await dio.get(Constants.headliensFor(country));
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("RESPONSE FAILED");
    }
  }
}
