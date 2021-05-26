import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_review_app/data/database.dart';
import 'package:my_review_app/data/myreview.dart';
import 'package:my_review_app/screens/home/home_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:my_review_app/screens/ranking/ranking_screen.dart';
import 'package:my_review_app/screens/write/write_screen.dart';

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
    return GetMaterialApp(
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
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/ranking', page: () => RankingScreen()),
        GetPage(name: '/write', page: () => WriteScreen()),
      ],
    );
  }
}
