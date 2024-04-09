import 'package:flutter/material.dart';
import 'package:my_news_app/views/category_view.dart';

class CatBox {
  Widget catbox(BuildContext context, String text) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(
                      category: text.toLowerCase(),
                    )));
      },
      child: Container(
        decoration: (const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(255, 255, 158, 73))),
        margin: EdgeInsets.all(8),
        height: 40,
        width: 80,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white),
        )),
      ),
    );
  }
}
