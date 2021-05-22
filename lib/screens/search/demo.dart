import 'package:flutter/material.dart';

class DemoItemSearch extends StatelessWidget {
  final title;
  final post;
  final owner;
  DemoItemSearch(this.post, this.title, this.owner);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('@$owner'),
        toolbarHeight: kToolbarHeight -15,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                ),
                Container(child: Text(post)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
