import 'package:flutter/material.dart';
import 'package:indulge_me/screens/profile/User/bio/bio.dart';
import 'package:indulge_me/screens/profile/User/plus/button.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Bio(),
          Plus(),
        ],
      ),
    );
  }
}
