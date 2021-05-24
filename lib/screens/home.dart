import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_review_app/components/myreview_card.dart';
import 'package:my_review_app/data/database.dart';
import 'package:my_review_app/data/myreview.dart';
import 'package:my_review_app/layouts/default_layout.dart';
import 'package:my_review_app/screens/write_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MyReviewDao? dao = GetIt.instance<MyReviewDao>();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => WriteScreen(),
            ),
          );
        },
      ),
      body: StreamBuilder<List<MyReviewData>>(
        stream: dao!.streamMyReviews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.separated(
                itemBuilder: (_, index) {
                  final item = data[index];

                  return MyReviewCard(
                    stars: item.stars,
                    category: item.category,
                    title: item.title,
                    content: item.content,
                    createdAt: item.createdAt,
                  );
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: data.length);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
