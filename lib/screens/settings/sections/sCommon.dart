import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:indulge_me/main.dart';
import 'package:indulge_me/widgets/common.dart';

class Scommon extends StatelessWidget {
  Scommon(this.title);
  final title;
  final Controller ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          settingsGroupTitle(title),
          GetBuilder<Controller>(
            //init: Controller(),
            builder: (val) => SwitchListTile(
              secondary: Icon(Icons.phone_android_rounded),
              title: Text('System'),
              subtitle: Text('Choose by default'),
              value: val.commonValue,
              onChanged: (bool value) {
                ctrl.toggleCommon(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
