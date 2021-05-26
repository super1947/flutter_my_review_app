import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyReviewCard extends StatefulWidget {
  final double? stars;
  final String? category;
  final String? categoryDetail;
  final String? title;
  final String? content;
  final DateTime? createdAt;

  MyReviewCard({
    required this.stars,
    required this.category,
    required this.categoryDetail,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  _MyReviewCardState createState() => _MyReviewCardState();
}

class _MyReviewCardState extends State<MyReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(0xff1f1e21), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            renderCategory(),
            renderCategoryDetail(),
            renderTitle(),
            SizedBox(
              height: 5,
            ),
            renderContent(),
          ],
        ),
      ),
    );
  }

  renderStars() {
    return Row(
      children: [
        RatingBarIndicator(
          rating: widget.stars!,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 20.0,
          direction: Axis.horizontal,
        ),
      ],
    );
  }

  renderCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.category!,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        renderStars()
      ],
    );
  }

  renderCategoryDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.categoryDetail!,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  renderContent() {
    final ca = widget.createdAt!;
    final dateStr = '${ca.year}-${ca.month}-${ca.day}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.content!,
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
        Text(
          dateStr,
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  renderTitle() {
    return Row(
      children: [
        Text(
          widget.title!,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
