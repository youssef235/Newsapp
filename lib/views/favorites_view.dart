import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/components/bottom_bar.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/widgets/articles_fav_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/app_bar.dart';
import '../cubit/news_cubit_cubit.dart';
import '../widgets/articles_widget.dart';

class FavoritesArticle extends StatelessWidget {
  FavoritesArticle({
    Key? key,
  }) : super(key: key);
  SharedPreferences? prefs;
  ArticleFAVListWidget articleListWidget = ArticleFAVListWidget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubitCubit(),
      child: BlocConsumer<NewsCubitCubit, NewsCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubitCubit cubit = NewsCubitCubit.get(context);
          return Scaffold(
            appBar: constAppBar("FAV NEWS", context),
            body: Column(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 13.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )),
                Expanded(
                    child: StreamBuilder(
                  stream: cubit.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      cubit.getfavlist();
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      return articleListWidget
                          .buildArticles(cubit.favoritesArticles);
                    } else {
                      return const Text("No data available");
                    }
                  },
                ))
              ],
            ),
            bottomNavigationBar:
                CustomBottomNavBar(selectedMenu: MenuState.favourite),
          );
        },
      ),
    );
  }
}
