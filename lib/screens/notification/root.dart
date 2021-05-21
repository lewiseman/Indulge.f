import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: "Indulge", style: TextStyle(color: Colors.blue[600])),
              TextSpan(text: ".me", style: TextStyle(color: Colors.black))
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
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
    );
  }
}
