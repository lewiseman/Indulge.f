import 'package:flutter/material.dart';
import 'package:indulge_me/screens/profile/Follow/root.dart';
import 'package:indulge_me/screens/profile/Saved/root.dart';
import 'package:indulge_me/screens/profile/User/root.dart';
import 'package:indulge_me/screens/profile/top.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              title: Text('Masaai_martin'),
              centerTitle: true,
              expandedHeight: 210,
              floating: true,
              snap: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: UserPic(),
              ),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Text('Profile'),
                  Text('Saved'),
                  Text('Followed'),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          children: [
            ProfileInfo(),
            Saved(),
            Follow()
          ],
        ),
      ),
    );
  }

  Widget pages() {
    return Center(
      child: Text('One'),
    );
  }
}
