import 'package:flutter/material.dart';
import 'package:indulge_me/screens/settings/body.dart';
import 'package:indulge_me/widgets/common.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: normalAppBar('Settings'),
      body: Container(
        child: SettingsContent(),
      ),
    );
  }
}
