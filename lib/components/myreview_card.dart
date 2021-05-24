import 'package:flutter/material.dart';

class MyReviewCard extends StatefulWidget {
  final double? stars;
  final String? category;
  final String? title;
  final String? content;
  final DateTime? createdAt;

  MyReviewCard({
    required this.stars,
    required this.category,
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
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            renderStars(),
            renderCategory(),
            renderTitle(),
            renderContent(),
          ],
        ),
      ),
    );
  }

  renderStars() {
    return Row(
      children: [
        Text(
          widget.stars.toString(),
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  renderCategory() {
    return Row(
      children: [
        Text(
          widget.category!,
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  renderContent() {
    return Row(
      children: [
        Text(
          widget.content!,
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  renderTitle() {
    final ca = widget.createdAt!;
    final dateStr = '${ca.year}-${ca.month}-${ca.day}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
}
