import 'package:flutter/material.dart';

class Follow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 18),
            height: 30,
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(30),
              borderWidth: 1,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('following'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('followers'),
                ),
              ],
              isSelected: [
                true,
                false,
              ],
              onPressed: (int index) {},
            ),
          ),
          //Container(child: FollowList())
        ],
      ),
    );
  }
}
