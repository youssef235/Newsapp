import 'package:flutter/material.dart';
import 'package:my_news_app/cubit/news_cubit_cubit.dart';
import '../components/app_bar.dart';
import '../components/bottom_bar.dart';
import '../models/article_model.dart';
import '../widgets/articles_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/category_widget.dart';
import '../widgets/popular_article.dart';
import '../widgets/search_box_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleListWidget articleListWidget = ArticleListWidget();
    return BlocProvider(
      create: (context) => NewsCubitCubit(),
      child: BlocConsumer<NewsCubitCubit, NewsCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubitCubit cubit = NewsCubitCubit.get(context);
          return Scaffold(
            appBar: constAppBar("NEWS", context),
            body: Column(
              children: [
                Searchbox().buildSearchbox(context, "general"),
                CategoryWidget().buildCategory(context),
                PopularArticle().populararticle(context, cubit.articlesList),
                Expanded(
                  child: StreamBuilder(
                    stream: cubit.stream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        cubit.fetchArticles("General");
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        return articleListWidget
                            .buildArticles(cubit.articlesList);
                      } else {
                        return const Text("No data available");
                      }
                    },
                  ),
                )
              ],
            ),
            bottomNavigationBar:
                CustomBottomNavBar(selectedMenu: MenuState.home),
          );
        },
      ),
    );
  }
}
