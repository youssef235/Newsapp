class ArticlesModel {
  final List<dynamic> articles;
  ArticlesModel({required this.articles});
  factory ArticlesModel.fromJson(Map<String, dynamic> jsonData) {
    return ArticlesModel(
      articles: jsonData['articles'],
    );
  }
}
