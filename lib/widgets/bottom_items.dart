import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<BubbleBottomBarItem> barItems = [
      BubbleBottomBarItem(
          backgroundColor: Get.context.theme.bottomNavigationBarTheme.selectedIconTheme.color,
          icon: Icon(
            Icons.dashboard,
            color: Get.context.theme.bottomNavigationBarTheme.unselectedIconTheme.color,
          ),
          activeIcon: Icon(
            Icons.dashboard,
            color: Get.context.theme.bottomNavigationBarTheme.selectedIconTheme.color,
          ),
          title: Text("Home")),
      BubbleBottomBarItem(
          backgroundColor: Get.context.theme.bottomNavigationBarTheme.selectedIconTheme.color,
          icon: Icon(
            Icons.search,
            color: Get.context.theme.bottomNavigationBarTheme.unselectedIconTheme.color,
          ),
          activeIcon: Icon(
            Icons.search,
            color: Get.context.theme.bottomNavigationBarTheme.selectedIconTheme.color,
          ),
          title: Text("Search")),
      BubbleBottomBarItem(
          backgroundColor: Get.context.theme.bottomNavigationBarTheme.selectedIconTheme.color,
          icon: Icon(
            Icons.notifications_none_rounded,
            color: Get.context.theme.bottomNavigationBarTheme.unselectedIconTheme.color,
          ),
          activeIcon: Icon(
            Icons.notifications_none_rounded,
            color: Get.context.theme.bottomNavigationBarTheme.selectedIconTheme.color,
          ),
          title: Text("Bell")),
      BubbleBottomBarItem(
          backgroundColor: Get.context.theme.bottomNavigationBarTheme.selectedIconTheme.color,
          icon: Icon(
            Icons.tag_faces_sharp,
            color: Get.context.theme.bottomNavigationBarTheme.unselectedIconTheme.color,
          ),
          activeIcon: Icon(
            Icons.tag_faces_sharp,
            color: Get.context.theme.bottomNavigationBarTheme.selectedIconTheme.color,
          ),
          title: Text("Me"))
    ];