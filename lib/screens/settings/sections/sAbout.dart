import 'package:indulge_me/screens/settings/about_pages.dart';
import 'package:indulge_me/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  About(this.title);
  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          settingsGroupTitle(title),
          ListTile(
            title: Text('Terms of Service'),
            subtitle: Text('Read the terms of service of indulge.me'),
            leading: Icon(Icons.description),
            onTap: () {
              Get.to(AboutWebView('Terms of Service', 'https://www.wikipedia.org/'));
            },
          ),
          ListTile(
            title: Text('Community Guidelines'),
            subtitle: Text('Guidelines created for our community'),
            leading: Icon(Icons.group_outlined),
            onTap: () {
              Get.to(AboutWebView('Community Guidelines', 'https://www.wikipedia.org/'));
            },
          ),
          ListTile(
            title: Text('Copyright Policy'),
            subtitle: Text('Read our copyright policy'),
            leading: Icon(Icons.copyright),
            onTap: () {
              Get.to(AboutWebView('Copyright Policy', 'https://www.literotica.com/stories/favstoriesv2.php'));
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            subtitle: Text('Read our privacy policy'),
            leading: Icon(Icons.collections_bookmark),
            onTap: () {
              Get.to(AboutWebView('Privacy Policy','https://www.sexstories.com/'));
            },
          ),
        ],
      ),
    );
  }
}
