import 'package:get/get.dart';
import 'package:indulge_me/screens/settings/pop.dart';
import 'package:indulge_me/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:indulge_me/main.dart';

class Spreferences extends StatelessWidget {
  Spreferences(this.title);
  final String title;
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
            init: Controller(),
            builder: (val) => SwitchListTile(
              secondary: Icon(Icons.phone_android_rounded),
              title: Text('Enable notifications'),
              subtitle: Text('Toggle to enable app notification'),
              value: val.preferencesNotificationValue,
              onChanged: (bool value) {
                ctrl.toggleNotification(value);
              },
            ),
          ),
          divider(),
          GetBuilder<Controller>(
            builder: (val) => ListTile(
              title: Text('Notifications settings'),
              leading: Icon(Icons.notifications_active),
              selected: val.preferencesNotificationValue,
            ),
          ),
          divider(),
          GetBuilder<Controller>(
            builder: (val) => ListTile(
              title: Text('Filter content'),
              leading: Icon(Icons.book),
              subtitle: Text('Show moderate content'),
              onTap: () {
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => ModalFit(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}