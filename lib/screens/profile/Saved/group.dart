import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ClossedGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      //pressed: true,
      style: NeumorphicStyle(
        color: Colors.black,
        depth: 2,
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
      ),
      child: Text(
        'My Favourites',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      onPressed: () {},
    );
  }
}
