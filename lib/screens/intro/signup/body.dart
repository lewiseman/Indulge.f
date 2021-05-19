import 'package:flutter/material.dart';
import 'package:indulge_me/screens/intro/login/body.dart';
import 'package:indulge_me/screens/intro/signup/form.dart';
import 'package:indulge_me/screens/intro/signup/or_divider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indulge_me/screens/intro/signup/signup.dart';
import 'package:indulge_me/screens/intro/components.dart';
import 'package:indulge_me/screens/intro/signup/social.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/intro/signup.svg",
              height: size.height * 0.25,
            ),
            SignupForm(),

            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LogIn();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/images/intro/google-plus.png",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    ),
    );
  }
}