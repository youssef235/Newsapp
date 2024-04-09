import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/components/bottom_bar.dart';

import '../components/app_bar.dart';
import '../cubit/news_cubit_cubit.dart';
import '../widgets/articles_widget.dart';
import '../widgets/search_box_widget.dart';

class CategoryView extends StatelessWidget {
  CategoryView({
    Key? key,
    required this.category,
  }) : super(key: key);
  String category;

  @override
  Widget build(BuildContext context) {
    ArticleListWidget articleListWidget = ArticleListWidget();
    return BlocProvider(
      create: (context) => NewsCubitCubit(),
      child: BlocConsumer<NewsCubitCubit, NewsCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubitCubit cubit = NewsCubitCubit.get(context);
          String CAT = category.toUpperCase();
          return Scaffold(
            appBar: constAppBar("$CAT NEWS", context),
            body: Column(
              children: [
                Searchbox().buildSearchbox(context, category),
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
                        cubit.fetchArticles(category);
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
            bottomNavigationBar: CustomBottomNavBar(selectedMenu: null),
          );
        },
      ),
    );
  }
}
