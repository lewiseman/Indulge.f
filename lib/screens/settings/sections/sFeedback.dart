import 'package:indulge_me/widgets/common.dart';
import 'package:flutter/material.dart';

class Sfeedback extends StatelessWidget {
  Sfeedback(this.title);
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
            title: Text('Give Feedback'),
            subtitle: Text('Your feedback is appreciated'),
            leading: Icon(Icons.feedback),
          ),
          ListTile(
            title: Text('FAQs'),
            subtitle: Text('Frequently asked questions'),
            leading: Icon(Icons.question_answer),
          ),
          ListTile(
            title: Text('Rate Ap'),
            subtitle: Text('Rate us'),
            leading: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
