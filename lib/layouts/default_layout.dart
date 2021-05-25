import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  final Widget body;
  final String? title;
  final FloatingActionButton? floatingActionButton;

  DefaultLayout({
    required this.body,
    this.title,
    this.floatingActionButton,
  });

  @override
  _DefaultLayoutState createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: widget.floatingActionButton,
      appBar: AppBar(),
      body: SafeArea(
        child: widget.body,
      ),
    );
  }
}
