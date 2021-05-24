import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:my_review_app/data/database.dart';
import 'package:my_review_app/data/myreview.dart';
import 'package:my_review_app/layouts/default_layout.dart';

class WriteScreen extends StatefulWidget {
  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? stars;
  String? category;
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
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
                                stars: Value(double.parse(this.stars!)),
                                title: Value(this.title),
                                content: Value(this.content),
                                category: Value(this.category),
                              ),
                            );

                            Navigator.of(context).pop();
                          }
                        }
                      },
                      child: Text('저장하기'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  renderTextFields() {
    return Expanded(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: '별점',
            ),
            onSaved: (val) {
              this.stars = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: '카테고리',
            ),
            onSaved: (val) {
              this.category = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: '제목',
            ),
            onSaved: (val) {
              this.title = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
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
