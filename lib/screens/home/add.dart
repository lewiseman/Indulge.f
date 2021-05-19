import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indulge_me/screens/items/audio/root.dart';
import 'package:indulge_me/screens/items/story/root.dart';
import 'package:indulge_me/screens/items/text/root.dart';

class AddItems extends StatelessWidget {
  const AddItems({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Container(
          height: 150,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                height: 150,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  children: [
                    addItem('Plain Text', TextContent()),
                    addItem('Audio', AudioContent()),
                    addItem('Story', StoryContent()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget addItem(String item, page) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(item),
            Icon(Icons.add),
          ],
        ),
      ),
      onTap: () {
        Get.off(page);
      },
    );
  }
}
