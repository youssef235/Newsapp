import 'package:flutter/material.dart';
import 'package:my_news_app/views/favorites_view.dart';
import 'package:my_news_app/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubit/news_cubit_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MenuState { home, favourite, upload, profile }

class CustomBottomNavBar extends StatelessWidget with ChangeNotifier {
  CustomBottomNavBar({
    Key? key,
    this.selectedMenu,
  }) : super(key: key);

  final MenuState? selectedMenu;
  SharedPreferences? prefs;

  @override
  Widget build(BuildContext context) {
    //String uid = FirebaseAuth.instance.currentUser!.uid;

    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 240, 240),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: const Icon(Icons.home),
                  color: MenuState.home == selectedMenu
                      ? Color.fromARGB(255, 255, 158, 73)
                      : inActiveIconColor,
                  onPressed: () {
                    //  userprovider.ischanged = false;

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeView()));
                  }),
              IconButton(
                  icon: const Icon(Icons.favorite_rounded),
                  color: MenuState.favourite == selectedMenu
                      ? Color.fromARGB(255, 255, 158, 73)
                      : inActiveIconColor,
                  onPressed: () async {
                    NewsCubitCubit().getfavlist();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FavoritesArticle()));
                  }),
            ],
          )),
    );
  }
}
