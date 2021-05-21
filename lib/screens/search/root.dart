import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:indulge_me/screens/search/search.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  //border: Border.all(color: )
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            onPressed: () => Get.to(Search()),
          ),
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
