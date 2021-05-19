import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:indulge_me/logic/registration/login.dart';
import 'package:indulge_me/screens/home/root.dart';

const kPrimaryColor = CupertinoColors.activeBlue;
const kPrimaryLightColor = CupertinoColors.white;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  int loginState = 0;
  String generalError = '';
  bool passEye = true;

  goHome() {
    setState(() {
      if (loginState == 2) {
        Timer(Duration(seconds: 2), route);
      }
    });
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Future<void> appLogin() async {
    int stage = await loginUser(username.text, password.text);
    setState(() {
      loginState = stage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        children: [
          //Username part
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              controller: username,
              //onChanged: () {},
              cursorColor: kPrimaryColor,
              style: TextStyle(color: kPrimaryColor),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                hintText: 'Username',
                hintStyle: TextStyle(color: kPrimaryColor),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username cannot be empty';
                }
                return null;
              },
            ),
          ),
          //Password part
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              controller: password,
              obscureText: passEye,
              cursorColor: kPrimaryColor,
              style: TextStyle(color: kPrimaryColor),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: kPrimaryColor),
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  color: kPrimaryColor,
                  onPressed: () {
                    setState(() {
                      passEye = !passEye;
                    });
                  },
                ),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'password cannot be empty';
                }
                return null;
              },
            ),
          ),
          //Submit button
          Text(
            generalError,
            style: TextStyle(color: Colors.red),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: CupertinoColors.activeBlue,
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      setState(() {
                        if (loginState == 0) {
                          animateButton();
                        }
                      });
                    } else {
                      return null;
                    }
                  },
                  child: loginChild(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget loginChild() {
    if (loginState == 0) {
      return new Text(
        'LOGIN',
        style: TextStyle(color: Colors.white),
      );
    } else if (loginState == 1) {
      return CircularProgressIndicator();
    } else if (loginState == 2) {
      goHome();
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    } else if (loginState == 3) {
      setState(() {
        generalError = 'You entered invalid credentials';
        loginState = 0;
      });
      return new Text(
        'LOGIN',
        style: TextStyle(color: Colors.white),
      );
    } else {
      return Text('No network');
    }
  }

  animateButton() async {
    setState(() {
      loginState = 1;
    });

    await appLogin();
  }
}
