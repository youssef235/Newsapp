import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';
import '../models/articles_model.dart';

class FetchArticlesFromAPI {
  final String apiKey = 'f0f8a9a1e8354cf283d48022e140ff29';

  Future<List<ArticleModel>> fetchdata(String category) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey"));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsondata = jsonDecode(data);
        ArticlesModel articles = ArticlesModel.fromJson(jsondata);
        List<ArticleModel> articlesList =
            articles.articles.map((e) => ArticleModel.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
    return List.empty();
  }
}
