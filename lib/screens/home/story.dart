import 'package:flutter/material.dart';
import 'package:indulge_me/logic/home/models.dart';
import 'package:indulge_me/screens/home/story_detail.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StoryItem extends StatelessWidget {
  StoryItem(this.post);
  final Story post;

  trimStory(String story) {
    if (story.length > 400) {
      String sub = story.substring(0, 300).trim();
      String filterStory = sub.replaceAll("\n", " ");
      return filterStory;
    } else {
      return story;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.context.theme.canvasColor,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.grey[300]),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${post.owner}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Get.context.theme.textTheme.headline1.color),
                        ),
                        Text(
                          '${post.date}',
                          style: TextStyle(
                              fontSize: 8,
                              height: 1.5,
                              color:
                                  Get.context.theme.textTheme.headline1.color),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
          InkWell(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${post.title}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Get.context.theme.textTheme.headline1.color),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    trimStory(post.story),
                    style: TextStyle(
                        color: Get.context.theme.textTheme.headline1.color),
                  ),
                ],
              ),
            ),
            onTap: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) => StoryItemDetail(post));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '👍',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '💬',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '👎',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
