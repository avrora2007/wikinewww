import 'package:dio/dio.dart';
import 'package:http/http.dart';

class RandomArticleService {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> getRandomArticle() async {
    final uri = Uri.https(
      "en.wikipedia.org",
      "/api/rest_v1/page/random/summary",
    );
    final response = await _dio.get(
      uri.toString()
    );
    return response.data;
  }
}
