import 'package:flutter/material.dart';
import 'package:indulge_me/screens/home/add.dart';
import 'package:indulge_me/screens/home/feed.dart';
import 'package:indulge_me/screens/home/filters.dart';
import 'package:indulge_me/widgets/common.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.context.theme.backgroundColor,
      appBar: AppBar(
        leading: FilterButton(),
        title: styledAppName(25),
        centerTitle: true,
        actions: [
          settingsIcon(context),
        ],
        elevation: 0,
        toolbarHeight: kToolbarHeight - 15,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showCupertinoModalBottomSheet(
            expand: false,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => AddItems(),
          );
        },
      ),
      body: FeedData(),
    );
  }
}
