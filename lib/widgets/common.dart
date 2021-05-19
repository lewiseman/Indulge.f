import 'package:flutter/material.dart';
import 'package:indulge_me/screens/settings/root.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Widget styledAppName(int fsize) {
  return RichText(
    text: TextSpan(
      style: Get.context.theme.textTheme.headline1,
      children: [
        TextSpan(text: "Indulge", style: TextStyle(color: Colors.blue[600])),
        TextSpan(text: ".me", style: TextStyle())
      ],
    ),
  );
}

Widget settingsIcon(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.settings),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SettingsPage()));
    },
  );
}

Widget filterIcon(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.nights_stay_outlined),
    onPressed: () {},
  );
}

Widget normalAppBar(String title) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Get.back();
      },
    ),
    elevation: 0,
    title: Text('$title', style: Get.context.theme.textTheme.headline2,),
    //backgroundColor: Colors.,
    centerTitle: true,
    toolbarHeight: kToolbarHeight - 15,
  );
}

Future<T> showFloatingModalBottomSheet<T>({
  BuildContext context,
  WidgetBuilder builder,
  Color backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet(
      context: context,
      builder: builder,
      containerWidget: (_, animation, child) => FloatingModal(
            child: child,
          ),
      expand: false);

  return result;
}

class FloatingModal extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const FloatingModal({Key key, this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}

Widget settingsGroupTitle(title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Text(
      '$title',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amber),
    ),
  );
}

Widget divider() {
  return Divider(
    height: 0.5,
  );
}
