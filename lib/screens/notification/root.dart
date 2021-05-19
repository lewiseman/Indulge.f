import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            CupertinoSliverNavigationBar(
              middle: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "Indulge",
                        style: TextStyle(color: Colors.blue[600])),
                    TextSpan(text: ".me", style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
              largeTitle: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BubbleTabIndicator(
                  indicatorHeight: 25.0,
                  indicatorColor: Colors.blueAccent[100],
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  // Other flags
                  // indicatorRadius: 1,
                  //insets: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'New',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'All',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          children: [
            ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text('New Notification'),
                    subtitle: Text(
                        'These are the new notifications that you may or have not read'),
                  );
                }),
            ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text('Old Notification'),
                    subtitle: Text(
                        'This is a notification description of your old activitys in here'),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
