import 'package:flutter/material.dart';

class Bio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 30),
      child: Stack(
        //overflow: Overflow.visible,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: .5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
                'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
          ),
          Positioned(
            top: -12,
            left: 26,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.black,
              child: Text(
                'My bio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
