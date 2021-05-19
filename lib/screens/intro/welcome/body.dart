import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:indulge_me/screens/intro/components.dart';
import 'package:indulge_me/screens/intro/login/body.dart';
import 'package:indulge_me/screens/intro/signup/body.dart';
import 'package:indulge_me/screens/intro/welcome/welcome.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to\n',
                      style: GoogleFonts.pacifico(
                          color: Get.context.theme.textTheme.headline2.color),
                    ),
                    TextSpan(
                      text: 'Indulge.me',
                      style: GoogleFonts.mcLaren(
                          color: Get.context.theme.textTheme.headline2.color),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/images/intro/chat.svg",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LOGIN",
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
              RoundedButton(
                text: "SIGN UP",
                color: Color(0xFFF1E6FF),
                textColor: Colors.black,
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
