import 'package:flutter/material.dart';
import 'package:indulge_me/screens/intro/login/form.dart';
import 'package:indulge_me/screens/intro/login/login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indulge_me/screens/intro/components.dart';
import 'package:indulge_me/screens/intro/signup/body.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/images/intro/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              LoginForm(),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUp();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
