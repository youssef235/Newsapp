import 'package:flutter/material.dart';

PreferredSizeWidget constAppBar(String title, BuildContext context) {
  return AppBar(
    leadingWidth: 25,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    ),
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
  );
}
