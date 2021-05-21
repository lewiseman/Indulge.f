import 'package:flutter/material.dart';
import 'package:indulge_me/logic/profile/general/services.dart';
import 'package:indulge_me/screens/profile/Follow/root.dart';
import 'package:indulge_me/screens/profile/Saved/root.dart';
import 'package:indulge_me/screens/profile/User/root.dart';
import 'package:indulge_me/screens/profile/top.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<List> data = getDetails();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('data');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CupertinoActivityIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return ErrorWidget.withDetails();
              }
              if (snapshot.hasData) {
                List user = snapshot.data;
                return DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, value) {
                      return [
                        SliverAppBar(
                          title: Text(user[1]),
                          centerTitle: true,
                          expandedHeight: 210,
                          floating: true,
                          snap: false,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: UserPic(user[0]),
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
                      children: [ProfileInfo(), Saved(), Follow()],
                    ),
                  ),
                );
              }
              return null;
            default:
              return null;
          }
        });
  }
}
