import 'package:flutter/material.dart';
import 'package:my_review_app/data/database.dart';
import 'package:my_review_app/data/myreview.dart';
import 'package:my_review_app/screens/home.dart';
import 'package:get_it/get_it.dart';

void main() {
  if (!GetIt.instance.isRegistered<MyReviewDao>()) {
    final db = Database();

    GetIt.instance.registerSingleton<MyReviewDao>(MyReviewDao(db));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          color: Colors.white,
          indent: 20,
          endIndent: 20,
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}
