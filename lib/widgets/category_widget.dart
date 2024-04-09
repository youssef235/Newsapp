import 'dart:js';
import 'package:flutter/material.dart';
import 'package:my_news_app/widgets/category_box.dart';
import '../views/category_view.dart';

class CategoryWidget {
  Widget buildCategory(
    BuildContext context,
    /* String category */
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CatBox().catbox(context, "Health"),
            CatBox().catbox(context, "Business"),
            CatBox().catbox(context, "Sports"),
            CatBox().catbox(context, "Science"),
            CatBox().catbox(context, "Technology"),
          ],
        ),
      ),
    );
  }
}
