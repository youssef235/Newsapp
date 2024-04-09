import 'dart:core';
import 'package:my_news_app/models/source_model.dart';

class ArticleModel {
  // String? id;
  String? title;
  String? imageurl;
  String? description;
  String? url;
  String? content;
  bool? isfav;

  ArticleModel({
    //  this.id,
    this.imageurl,
    this.title,
    this.description,
    this.url,
    this.content,
    this.isfav,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> jsondata) {
    return ArticleModel(
      //  id: jsondata['source']['id'],
      title: jsondata['title'],
      imageurl: jsondata['urlToImage'] ??
          "https://www.kindacode.com/wp-content/uploads/2022/02/beach.jpeg",
      description: jsondata['description'],
      url: jsondata['url'],
      content: jsondata['content'],
    );
  }

  Map toMap() {
    return {
      //  'id': id,
      "title": title,
      "urlToImage": imageurl,
      "description": description,
      "url": url,
      "content": content
    };
  }
}
