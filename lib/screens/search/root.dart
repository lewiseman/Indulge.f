import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoSearchTextField(),
        ),
        backgroundColor: Get.context.theme.appBarTheme.color,
        elevation: 0,
      ),
      body: ListView(
        children: [          
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('data')),
          )
        ],
      ),
    );
  }
}