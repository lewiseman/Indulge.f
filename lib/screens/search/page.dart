import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indulge_me/screens/search/story_show.dart';

class InactiveSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return StorySections(index);
      },
    );
  }
}

class StorySections extends StatelessWidget {
  final num;
  const StorySections(this.num);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          stiryTitle(),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                StoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row stiryTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(40),
                //color: Colors.green[50],
              ),
              child: Text(
                '#${num + 1}',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('data'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child:
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
        )
      ],
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 16, left: 16),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(16)),
        height: 120,
        width: 100,
      ),
      onTap: () {
        Get.to(StoryShow());
      },
    );
  }
}
