import 'package:flutter/material.dart';

class Plus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: IconButton(
        icon: Icon(
          Icons.add_outlined,
          size: 36,
        ),
        onPressed: () {},
      ),
    );
  }
}
