import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:indulge_me/logic/home/models.dart';
import 'package:get/get.dart';

class StoryItemDetail extends StatelessWidget {
  StoryItemDetail(this.post);
  final Story post;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            CupertinoSliverNavigationBar(
              middle: Text('@${post.owner}',style: Get.context.theme.textTheme.headline2,),
              largeTitle: Column(
                children: [
                  Text(
                    '${post.title}',
                    style: Get.context.theme.textTheme.headline2,
                    softWrap: true,
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(children: [
          CupertinoScrollbar(
            thickness: 10,
            radius: Radius.circular(10),
            child: SingleChildScrollView(
              child: InteractiveViewer(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    '${post.story}',
                    style: Get.context.theme.textTheme.headline4,
                    textScaleFactor: 1.2,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Get.context.theme.canvasColor,
            child: Center(child: CupertinoActivityIndicator()),
          )
        ]),
      ),
    );
  }
}
