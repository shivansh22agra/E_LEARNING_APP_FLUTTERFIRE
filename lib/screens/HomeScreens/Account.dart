import 'package:e_leaning_app/screens/Login_Screen.dart';
import 'package:e_leaning_app/screens/Splash_Screen.dart';
import 'package:e_leaning_app/services/authentication.dart';
import 'package:e_leaning_app/services/storage.dart';
import 'package:e_leaning_app/utils/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    finalName??"finalName",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(EvaIcons.google, color: Colors.red),
                      Text(
                        finalEmail??"finalEmail",
                        style: kstyle.copyWith(fontSize: 20),
                      )
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Become An Instrutor",
                      style: kstyle.copyWith(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Video prefernces",
                style: kstyle,
              ),
            ),
            ListTile(
              trailing: Icon(
                EvaIcons.arrowForward,
                color: Colors.white,
              ),
              title: Text(
                "Download Options",
                style: kstyle.copyWith(fontSize: 20),
              ),
            ),
            ListTile(
              trailing: Icon(
                EvaIcons.arrowForward,
                color: Colors.white,
              ),
              title: Text(
                "Video Playback Options",
                style: kstyle.copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),

              /// padding: const EdgeInsets.all(8.0),
              child: Text(
                "Account settings",
                style: kstyle,
              ),
            ),
            ListTile(
              trailing: Icon(
                EvaIcons.arrowForward,
                color: Colors.white,
              ),
              title: Text(
                "Account security",
                style: kstyle.copyWith(fontSize: 20),
              ),
            ),
            ListTile(
              trailing: Icon(
                EvaIcons.arrowForward,
                color: Colors.white,
              ),
              title: Text(
                "Email notifications preferences",
                style: kstyle.copyWith(fontSize: 20),
              ),
            ),
            ListTile(
              trailing: Icon(
                EvaIcons.arrowForward,
                color: Colors.white,
              ),
              title: Text(
                "Learning reminders",
                style: kstyle.copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              //  padding: const EdgeInsets.all(8.0),
              child: Text(
                "Support",
                style: kstyle,
              ),
            ),
            ListTile(
              trailing: Icon(
                EvaIcons.arrowForward,
                color: Colors.white,
              ),
              title: Text("About Udemy", style: kstyle.copyWith(fontSize: 20)),
            ),
            ListTile(
              trailing: Icon(
                EvaIcons.arrowForward,
                color: Colors.white,
              ),
              title: Text("About Udemy for Buisness",
                  style: kstyle.copyWith(fontSize: 20)),
            ),
            ListTile(
              trailing: Icon(
                EvaIcons.arrowForward,
                color: Colors.white,
              ),
              title: Text("FAQs", style: kstyle.copyWith(fontSize: 20)),
            ),
            Center(
              child: SizedBox(
                height: 30,
                width: 200,
                child: MaterialButton(
                  onPressed: () async {
                    await authentication.signout().whenComplete(() {
                      SecureStorage secureStorage = SecureStorage();
                      secureStorage.deleteSecureStorage("email");
                    }).whenComplete(() => Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Login_Screen(),
                            type: PageTransitionType.rightToLeftWithFade)));
                  },
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.shoppingBagOutline,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.black,
        title: Text(
          "Account",
          style: kstyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
