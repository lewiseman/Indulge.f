import 'package:flutter/material.dart';

class FollowList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
          ),
          title: Text('Martin Bush'),
          subtitle: Text('A content creator'),
        );
      },
    );
  }
}
