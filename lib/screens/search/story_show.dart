import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryShow extends StatefulWidget {
  @override
  _StoryShowState createState() => _StoryShowState();
}

class _StoryShowState extends State<StoryShow> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoryView(
        controller: controller,
        inline: false,
        repeat: false,
        storyItems: storyItems,
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          } else if (direction == Direction.right) {
            print('object');
          }
        },
      ),
    );
  }
}

final List<StoryItem> storyItems = [
  StoryItem.text(
    title: '''“When you talk, you are only repeating something you know.
       But if you listen, you may learn something new.” 
       – Dalai Lama''',
    backgroundColor: Colors.teal,
  ),
  StoryItem.text(
    title: '''“When you talk, you are only repeating something you know.
       But if you listen, you may learn something new.” 
       – Dalai Lama''',
    backgroundColor: Colors.red,
  ),
  StoryItem.text(
      title: '''“When you talk, you are only repeating something you know.
       But if you listen, you may learn something new.” 
       – Dalai Lama''',
      backgroundColor: Colors.green,
      duration: Duration(seconds: 5)),
  StoryItem.pageImage(
    url:
        "https://images.unsplash.com/photo-1553531384-cc64ac80f931?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bW91bnRhaW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    controller: StoryController(),
  ),
  StoryItem.inlineImage(
    url:
        "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
    controller: StoryController(),
    caption: Text(
      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
      style: TextStyle(
        color: Colors.white,
        backgroundColor: Colors.black54,
        fontSize: 17,
      ),
    ),
  ),
  StoryItem.pageImage(
    url:
        "https://images.unsplash.com/photo-1553531384-cc64ac80f931?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bW91bnRhaW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    controller: StoryController(),
  ),
];
