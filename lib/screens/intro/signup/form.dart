import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:indulge_me/logic/registration/signup.dart';
import 'package:indulge_me/screens/home/root.dart';

const kPrimaryColor = CupertinoColors.activeBlue;
const kPrimaryLightColor = CupertinoColors.white;

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  int signupState = 0;
  String generalError = '';
  bool passEye = true;

  final passOneValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be atleast 8 digits long')
  ]);

  final emailVal = MultiValidator([
    RequiredValidator(errorText: 'Email can\'t be empty'),
    EmailValidator(errorText: 'Enter a valid email'),
  ]);

  goHome() {
    setState(() {
      if (signupState == 2) {
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

  final passTwoValidator = MultiValidator([
    RequiredValidator(errorText: 'confirm password'),
  ]);

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
              validator:
                  RequiredValidator(errorText: 'Username can\'t be empty'),
            ),
          ),
          //Email part
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              controller: email,
              cursorColor: kPrimaryColor,
              style: TextStyle(color: kPrimaryColor),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email_outlined,
                  color: kPrimaryColor,
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: kPrimaryColor),
                border: InputBorder.none,
              ),
              validator: emailVal,
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
              obscureText: true,
              cursorColor: kPrimaryColor,
              style: TextStyle(color: kPrimaryColor),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: kPrimaryColor),
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                ),
                border: InputBorder.none,
              ),
              validator: passOneValidator,
            ),
          ),
          Text(
            generalError,
            style: TextStyle(color: Colors.red),
          ),
          //Submit button
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: Container(
                color: CupertinoColors.activeBlue,
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      animateButton();
                    } else {
                      return null;
                    }
                  },
                  child: signupChild(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget signupChild() {
    if (signupState == 0) {
      return Text(
        'SIGNUP',
        style: TextStyle(color: Colors.white),
      );
    } else if (signupState == 1) {
      return CircularProgressIndicator();
    } else if (signupState == 2) {
      goHome();
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    } else if (signupState == 3) {
      setState(() {
        generalError = 'You entered invalid credentials';
        signupState = 0;
      });
      return new Text(
        'SIGNUP',
        style: TextStyle(color: Colors.white),
      );
    } else {
      return Text('no network');
    }
  }

  animateButton() async {
    setState(() {
      signupState = 1;
    });

    await appSignup();
  }

  Future<void> appSignup() async {
    int stage = await signupUser(email.text, username.text, password.text);
    setState(() {
      signupState = stage;
    });
  }
}
