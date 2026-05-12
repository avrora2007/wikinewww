import '../../../domain/models/summary.dart';

class RandomArticleService {
  Future<Summary> getRandomArticleSummary() async {
    final uri = Uri.https(
      "en.wikipedia.org",
      "/api/rest_v1/page/random/summary",
    );
    final response = await get(uri);
    if (response.statusCode != 200) {
      throw const HttpException("failed to recieve page summary");
    }
    return Summary.fromJson(jsonDecode(response.body) as Map<String, Object?>);
  }
}