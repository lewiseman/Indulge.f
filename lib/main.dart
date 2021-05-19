import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indulge_me/screens/intro/root.dart';
import 'package:indulge_me/root.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class Controller extends GetxController {
  final box = GetStorage();
  String authToken;
  var commonValue;
  var preferencesNotificationValue;
  int selectedIndex = 0;

  bool get defaultCommonSettings => box.read('defaultCommon');
  bool get defaultPreferencesNotification => box.read('defaultPreferences');
  //bool get userLocalAuthToken => box.read('authToken');

  @override
  void onInit() {
    initCommonValue();
    initPreferencesValue();
    initToken();
    super.onInit();
  }

  String userLocalAuthToken() {
    return box.read('authToken');
  }

  //login auth
  addAuth(String token) {
    box.write('authToken', token);
  }

  //check login token
  initToken() {
    if (userLocalAuthToken == null) {
      authToken = 'none';
      update();
    } else {
      authToken = userLocalAuthToken.toString();
      update();
    }
  }

  //check if it is first time for the app
  bool get firstTime => box.read('firstTime') ?? true;
  bool getTimeFlag() {
    if (firstTime) {
      box.write('firstTime', false);
      return true;
    } else {
      return false;
    }
  }

  //common part
  initCommonValue() {
    if (defaultCommonSettings == null) {
      commonValue = true;
      update();
    } else {
      commonValue = defaultCommonSettings;
      update();
    }
  }

  void toggleCommon(value) {
    box.write('defaultCommon', value);
    commonValue = value;
    update();
  }

  //preferences
  initPreferencesValue() {
    if (defaultPreferencesNotification == null) {
      preferencesNotificationValue = true;
      update();
    } else {
      preferencesNotificationValue = defaultPreferencesNotification;
      update();
    }
  }

  void toggleNotification(value) {
    box.write('defaultPreferences', value);
    preferencesNotificationValue = value;
    update();
  }

  //bottom bar items
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scontroller = Get.put(Controller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indulge.me',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: scontroller.getTimeFlag() ? IntroPage() : IndulgeMe(),
    );
  }
}
