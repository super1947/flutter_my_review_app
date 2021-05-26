import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:my_review_app/components/myreview_card.dart';
import 'package:my_review_app/controller/navcontroller.dart';
import 'package:my_review_app/data/database.dart';
import 'package:my_review_app/data/myreview.dart';
import 'package:my_review_app/screens/ranking/ranking_screen.dart';
import 'package:my_review_app/screens/write/write_screen.dart';
import 'package:collection/collection.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  bool closeTopContainer = false;
  double topContainer = 0;
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.25;
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(23),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    hintText: '검색',
                  ),
                ),
              ),
              buildCategoryCard(title: '카테고리'),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: categoriesScroller),
              ),
              buildCategoryCard(title: '목록'),
              SizedBox(
                height: 10,
              ),
              renderMyReviewCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navController.selectedIndex,
          onTap: (index) {
            navController.selectedIndex = index;
            if (navController.selectedIndex == 0) {
              Get.to(HomeScreen());
            } else if (navController.selectedIndex == 1) {
              Get.to(RankingScreen());
            } else if (navController.selectedIndex == 2) {
              Get.to(WriteScreen());
            }
          },
          selectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.black12,
          unselectedItemColor: Colors.white,
          items: [
            _bottomNavigationBarItem(
                icon: Icons.home_outlined, actIcon: Icons.home, label: '홈'),
            _bottomNavigationBarItem(
                icon: Icons.star_border, actIcon: Icons.star, label: '랭킹'),
            _bottomNavigationBarItem(
                icon: Icons.add_box_outlined,
                actIcon: Icons.add_box,
                label: '글쓰기')
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem({IconData? icon, IconData? actIcon, String? label}) {
    return BottomNavigationBarItem(
        icon: Icon(icon), label: label, activeIcon: Icon(actIcon));
  }

  Widget buildCategoryCard({String? title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      child: Row(
        children: [
          Text(
            title!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}

renderMyReviewCard() {
  final MyReviewDao? dao = GetIt.instance<MyReviewDao>();
  return Container(
    height: 200,
    child: StreamBuilder<List<MyReviewData>>(
      stream: dao!.streamMyReviews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          print(data);
          return Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemBuilder: (_, index) {
                  final item = data[index];
                  return MyReviewCard(
                    stars: item.stars,
                    category: item.category,
                    categoryDetail: item.categoryDetail,
                    title: item.title,
                    content: item.content,
                    createdAt: item.createdAt,
                  );
                },
                itemCount: data.length),
          );
        } else {
          return Container();
        }
      },
    ),
  );
}

class CategoriesScroller extends StatefulWidget {
  const CategoriesScroller();

  @override
  _CategoriesScrollerState createState() => _CategoriesScrollerState();
}

class _CategoriesScrollerState extends State<CategoriesScroller> {
  final MyReviewDao? dao = GetIt.instance<MyReviewDao>();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return StreamBuilder<List<MyReviewData>>(
        stream: dao!.streamMyReviews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            print(data);
            final groupByCategory = data.groupListsBy((e) => e.category);
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 20),
                        height: categoryHeight,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffee2a7b), Color(0xffff7db8)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "가전/가구/인테리어",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${groupByCategory['가전/가구/인테리어'] == null ? 0 : groupByCategory['가전/가구/인테리어']?.length} items',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 20),
                        height: categoryHeight,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xfffbb040), Color(0xfff9ed32)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "음식/영화/도서",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${groupByCategory['음식/영화/도서'] == null ? 0 : groupByCategory['음식/영화/도서']?.length} items',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 20),
                        height: categoryHeight,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff2d388a), Color(0xff00aeef)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "의류/잡화/스포츠",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${groupByCategory['의류/잡화/스포츠'] == null ? 0 : groupByCategory['의류/잡화/스포츠']?.length} items',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 20),
                        height: categoryHeight,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff7f00ff), Color(0xffe100ff)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "기타",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${groupByCategory['기타'] == null ? 0 : groupByCategory['기타']?.length} items',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
