import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../services/fetch_from_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'news_cubit_state.dart';

class NewsCubitCubit extends Cubit<NewsCubitState> {
  List<ArticleModel> _articlesList = [];
  List<ArticleModel> get articlesList => _articlesList;
  Color color = Colors.black;
  List<ArticleModel> _favoritesArticles = [];
  SharedPreferences? prefs;
  List<ArticleModel> get favoritesArticles => _favoritesArticles;
  NewsCubitCubit() : super(const NewsCubitInitial());
  static NewsCubitCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<List<ArticleModel>> fetchArticles(String category) async {
    _articlesList =
        await FetchArticlesFromAPI().fetchdata(category.toLowerCase());
    emit(const NewsCubitInitial());
    return articlesList;
  }

  Future<List<ArticleModel>> runFilter(
      String enteredKeyword, String category) async {
    fetchArticles(category);
    if (enteredKeyword.isEmpty) {
      _articlesList = await FetchArticlesFromAPI().fetchdata(category);
    } else {
      _articlesList = articlesList
          .where((item) =>
              item.title!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      emit(const NewsCubitSearch());
      print(articlesList);
    }
    emit(const NewsCubitSearch());
    return articlesList;
  }

  Future<List<ArticleModel>> onFavPressed(ArticleModel am) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<dynamic>? list = prefs.getStringList("list") ??
        _favoritesArticles.map((e) => jsonEncode(e.toMap())).toList();
    List<dynamic>? decodedList = json.decode(list.toString());
    _favoritesArticles =
        decodedList!.map((e) => ArticleModel.fromJson(e)).toList();
    _favoritesArticles.add(am);
    await prefs.setStringList(
        "list", _favoritesArticles.map((e) => jsonEncode(e.toMap())).toList());
    print(favoritesArticles);
    color = Colors.red;
    emit(const NewsCubitFavPressed());
    return favoritesArticles;
  }

  Future<List<ArticleModel>> getfavlist() async {
    prefs = await SharedPreferences.getInstance();
    List<dynamic>? list = prefs?.getStringList("list");
    List<dynamic>? decodedList = json.decode(list!.toString());
    _favoritesArticles =
        decodedList!.map((e) => ArticleModel.fromJson(e)).toList();

    emit(const NewsCubitgetfavlist());
    return favoritesArticles;
  }

  void on_un_fav_pressed() {
    color = Colors.black;
    emit(const NewsCubitUnFavPressed());
  }
}
