import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:indulge_me/logic/home/models.dart';
import 'package:indulge_me/logic/home/services.dart';
import 'package:indulge_me/screens/home/story.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedData extends StatefulWidget {
  @override
  _FeedDataState createState() => _FeedDataState();
}

class _FeedDataState extends State<FeedData> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  int page = 1;

  Future<List<Story>> data = getFirstStories();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (BuildContext context, AsyncSnapshot<List<Story>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('data');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CupertinoActivityIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              //fix this errror message
              return ErrorWidget.withDetails();
            }
            if (snapshot.hasData) {
              List<Story> posts = snapshot.data;
              return SmartRefresher(
                controller: _refreshController,
                header: ClassicHeader(
                  refreshStyle: RefreshStyle.Follow,
                  height: 40,
                  refreshingIcon: CupertinoActivityIndicator(),
                  refreshingText: '',
                ),
                onRefresh: () async {
                  page++;
                  Future<List<Story>> fnewData = getOtherStories(page);
                  List<Story> newData = await fnewData;
                  setState(() {
                    //posts = newData;
                    //posts = newData + posts;
                    //posts.addAll(newData);
                    posts.insertAll(0, newData);
                    //data = fnewData;
                    _refreshController.refreshCompleted();
                  });
                },
                child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return StoryItem(posts[index]);
                    }),
              );
            }
            return Text('unknown');
          default:
            return null;
        }
      },
    );
  }
}
