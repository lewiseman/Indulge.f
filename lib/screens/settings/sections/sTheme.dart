import 'package:flutter/material.dart';
import 'package:indulge_me/widgets/common.dart';
import 'package:get/get.dart';

Widget sTheme(title) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingsGroupTitle(title),
        ListTile(
          title: Text('Change theme'),
          subtitle: Text('Press to switch between Light and Dark mode.'),
          onTap: () {
            if (Get.isDarkMode) {
              Get.changeThemeMode(ThemeMode.light);
            } else {
              Get.changeThemeMode(ThemeMode.dark);
            }
          },
        )
      ],
    ),
  );
}

Widget cTheme(title) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: settingsGroupTitle(title),
        ),
      ],
    ),
  );
}
