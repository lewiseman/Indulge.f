import 'package:flutter/material.dart';
import 'package:indulge_me/screens/home/root.dart';
import 'package:indulge_me/screens/notification/root.dart';
import 'package:indulge_me/screens/profile/root.dart';
import 'package:indulge_me/screens/search/root.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:indulge_me/main.dart';
import 'package:get/get.dart';
import 'package:indulge_me/widgets/bottom_items.dart';
import 'package:flutter/cupertino.dart';

class Themes {
  final Color appColor = CupertinoColors.activeBlue;
  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: CupertinoColors.lightBackgroundGray,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.grey[800],
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CupertinoColors.white,
      elevation: 0,
      unselectedIconTheme:
          IconThemeData(color: CupertinoColors.darkBackgroundGray),
      selectedIconTheme: IconThemeData(color: CupertinoColors.activeBlue),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.black,
      ),
      headline2: TextStyle(
        color: CupertinoColors.black,
        fontSize: 18,
      ),
      headline4: TextStyle(color: CupertinoColors.black, fontSize: 14),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: CupertinoColors.lightBackgroundGray,
    canvasColor: CupertinoColors.white,
  );

  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: CupertinoColors.darkBackgroundGray,
      elevation: 0,
      iconTheme: IconThemeData(
        color: CupertinoColors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CupertinoColors.black,
      elevation: 0,
      unselectedIconTheme:
          IconThemeData(color: CupertinoColors.lightBackgroundGray),
      selectedIconTheme: IconThemeData(
        color: CupertinoColors.activeBlue,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.white,
      ),
      headline2: TextStyle(color: CupertinoColors.white, fontSize: 18),
      headline4: TextStyle(color: CupertinoColors.white, fontSize: 14),
    ),
    backgroundColor: CupertinoColors.darkBackgroundGray,
    canvasColor: CupertinoColors.black,
  );
}

class IndulgeMe extends StatelessWidget {
  final Controller ctrl = Get.find();
  static List<Widget> _widgetOPtions = [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Controller>(
        builder: (val) => _widgetOPtions.elementAt(val.selectedIndex),
      ),
      bottomNavigationBar: GetBuilder<Controller>(
        builder: (val) => BubbleBottomBar(
            backgroundColor:
                Get.context.theme.bottomNavigationBarTheme.backgroundColor,
            opacity: .2,
            currentIndex: val.selectedIndex,
            onTap: ctrl.onItemTapped,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            elevation: 0,
            hasInk: true, //new, gives a cute ink effect
            inkColor: Colors.black12,
            items: barItems),
      ),
    );
  }
}
