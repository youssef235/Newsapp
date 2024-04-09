import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubit/news_cubit_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/article_model.dart';
import '../views/favorites_view.dart';

class ArticleFAVListWidget {
  // List<ArticleModel> favoriteArticles = [];

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  Widget buildArticles(List<ArticleModel> articles) {
    return ScrollablePositionedList.builder(
      itemCount: articles.length,
      initialScrollIndex: 1,
      itemBuilder: (context, index) {
        final Articles = articles[index];
        return InkWell(
          onTap: () {
            launchUrl(Uri.parse(Articles.url!));
          },
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 100,
            width: double.maxFinite,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(25),
                    child: Image.network(
                      Articles.imageurl!,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(flex: 3, child: Text(Articles.title!)),
              ],
            ),
          ),
        );
      },
    );
  }
}
