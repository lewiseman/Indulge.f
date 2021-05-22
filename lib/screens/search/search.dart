import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:indulge_me/logic/search/services.dart';
import 'package:indulge_me/screens/search/demo.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FocusNode node = FocusNode();
  StreamController _streamController;
  Stream _stream;

  Timer _debounce;

  _search(data) async {
    List<PostSearch> content = await searchData(data);
    _streamController.add(content);
  }

  @override
  initState() {
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(node);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoSearchTextField(
            focusNode: node,
            style: TextStyle(color: CupertinoColors.white),
            onChanged: (String value) {
              if (_debounce?.isActive ?? false) _debounce.cancel();
              _debounce = Timer(const Duration(microseconds: 1000), () {
                _search(value);
              });
            },
          ),
        ),
        backgroundColor: Get.context.theme.appBarTheme.color,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Text('Type something ...'),
            );
          } else if (snapshot.hasData) {
            List<PostSearch> results = snapshot.data;
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (buider, index) {
                return ListTile(
                  leading: Icon(Icons.blur_on_outlined),
                  title: Text(
                    results[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(results[index].story),
                  onLongPress: () {},
                  onTap: () {
                    String title = results[index].title;
                    String post = results[index].story;
                    String owner = results[index].owner;
                    Get.off(DemoItemSearch(post, title, owner));
                  },
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
