import 'package:e_leaning_app/screens/Home_Screen.dart';
import 'package:e_leaning_app/services/authentication.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Login_Screen extends StatelessWidget {
  Authentication authentication = Authentication();
  static String id = "Login_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/pic.png"),
          SizedBox(
            height: 70,
            width: 300,
            child: ElevatedButton.icon(
                icon: Icon(EvaIcons.google),
                style: ElevatedButton.styleFrom(primary: Color(0xFF333333)),
                onPressed: () async {
                  await authentication.googlesignin().whenComplete(
                        () => Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Home_Page(),
                              type: PageTransitionType.fade),
                        ),
                      );
                },
                label: Center(
                    child: Text(
                  "Google Login",
                  style: TextStyle(color: Colors.black),
                ))),
          )
        ],
      ),
    );
  }
}
