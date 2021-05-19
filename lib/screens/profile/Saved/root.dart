import 'package:flutter/material.dart';
import 'package:indulge_me/screens/profile/Saved/group.dart';
import 'package:indulge_me/screens/profile/User/plus/button.dart';

class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
          ClossedGroup(),
          ClossedGroup(),
          ClossedGroup(),
          Plus(),
        ],
      ),
    );
  }
}
