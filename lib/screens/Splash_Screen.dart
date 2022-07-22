import 'dart:async';

import 'package:e_leaning_app/screens/Home_Screen.dart';
import 'package:e_leaning_app/screens/Login_Screen.dart';
import 'package:e_leaning_app/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

String? finalEmail;
String? finalName; 
// final? FullName;
class Splash_Screen extends StatefulWidget {
  static String id = "Splash_Screen";
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    secureStorage.readSecureStorage("email").then((value) {
      finalEmail = value;
    });
    secureStorage.readSecureStorage("name").then((value) {
      finalName = value;
    });
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: finalEmail !=null ? Home_Page() : Login_Screen(), type: PageTransitionType.bottomToTop));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Lottie.network(
              "https://assets2.lottiefiles.com/packages/lf20_9rcmfngo.json")
        ],
      ),
    ));
  }
}
