import 'package:flutter/material.dart';
import '../models/article_model.dart';

class PopularArticle {
  Widget populararticle(BuildContext context, List<ArticleModel> articles) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Card(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Builder(builder: (context) {
                final Articles = articles[2];
                return Expanded(
                  child: SizedBox(
                    height: 200,
                    width: 330,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48),
                        child: Image.network(
                          Articles.imageurl!,
                          fit: BoxFit.fill,
                          height: 200,
                          width: 300,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            Center(
              child: Card(
                child: SizedBox(
                  height: 70,
                  child: Builder(builder: (context) {
                    final Articles = articles[0];
                    return Center(
                      child: Text(
                        maxLines: 4,
                        Articles.title!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
