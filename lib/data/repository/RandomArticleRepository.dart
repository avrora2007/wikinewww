import '../service/RandomArticleService.dart';
import '../../domain/models/summary.dart';

class RandomArticleRepository {
  final _randomArticleService = RandomArticleService();
  Future<Summary> getRandomArticle() async {
    final data = await _randomArticleService.getRandomArticle();
    return Summary.fromJson(data);
  }
}
