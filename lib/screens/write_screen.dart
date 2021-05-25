import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:my_review_app/data/database.dart';
import 'package:my_review_app/data/myreview.dart';

class WriteScreen extends StatefulWidget {
  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  double? stars;
  String? category;
  String? title;
  String? content;

  String? categoryResult;

  static final List<String> categoryItems = <String>[
    '가전/가구/인테리어',
    '음식/영화/도서',
    '의류/잡화/스포츠',
    '기타'
  ];

  String value = categoryItems.first;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black12,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                renderTextFields(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            if (this.content != null &&
                                this.title != null &&
                                this.category != null &&
                                this.stars != null) {
                              final dao = GetIt.instance<MyReviewDao>();
                              await dao.insertMyReview(
                                MyReviewCompanion(
                                  stars: Value(this.stars!),
                                  title: Value(this.title!),
                                  content: Value(this.content!),
                                  category: Value(this.category!),
                                ),
                              );

                              Navigator.of(context).pop();
                            }
                          }
                        },
                        child: Text(
                          '저장하기',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  renderTextFields() {
    return Expanded(
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: '카테고리'),
            value: value,
            items: categoryItems
                .map((categoryItems) => DropdownMenuItem<String>(
                      child: Text(
                        categoryItems,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      value: categoryItems,
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                this.value = value!;
              });
            },
            onSaved: (val) {
              this.category = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            maxLength: 20,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2.0,
                ),
              ),
              hintText: '이름',
            ),
            onSaved: (val) {
              this.title = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return '필수 입력 항목입니다.';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          RatingBar.builder(
            initialRating: 0,
            minRating: 0.5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            glow: false,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (val) {
              this.stars = val;
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            maxLines: null,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2.0,
                ),
              ),
              isDense: true,
              hintText: '내용',
            ),
            onSaved: (val) {
              this.content = val;
            },
          ),
        ],
      ),
    );
  }
}
