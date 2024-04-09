part of 'news_cubit_cubit.dart';

abstract class NewsCubitState {
  const NewsCubitState();
}

class NewsCubitInitial extends NewsCubitState {
  const NewsCubitInitial();
}

class NewsCubitSearch extends NewsCubitState {
  const NewsCubitSearch();
}

class NewsCubitFavPressed extends NewsCubitState {
  const NewsCubitFavPressed();
}

class NewsCubitUnFavPressed extends NewsCubitState {
  const NewsCubitUnFavPressed();
}

class NewsCubitgetfavlist extends NewsCubitState {
  const NewsCubitgetfavlist();
}
