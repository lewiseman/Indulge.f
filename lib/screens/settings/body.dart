import 'package:flutter/material.dart';
import 'package:indulge_me/screens/settings/sections/sAbout.dart';
import 'package:indulge_me/screens/settings/sections/sCommon.dart';
import 'package:indulge_me/screens/settings/sections/sFeedback.dart';
import 'package:indulge_me/screens/settings/sections/sPreferences.dart';
import 'package:indulge_me/screens/settings/sections/sTheme.dart';

class SettingsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          sTheme('App Flavour'),
          Spreferences('Preferences'),
          Scommon('Common'),
          About('About'),
          Sfeedback('Feedback'),
        ],
      ),
    );
  }
}
