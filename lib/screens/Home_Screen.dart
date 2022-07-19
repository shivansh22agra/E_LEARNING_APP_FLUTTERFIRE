import 'package:e_leaning_app/screens/HomeScreens/Account.dart';
import 'package:e_leaning_app/screens/HomeScreens/Featured.dart';
import 'package:e_leaning_app/screens/HomeScreens/Mycourses.dart';
import 'package:e_leaning_app/screens/HomeScreens/Search.dart';
import 'package:e_leaning_app/screens/HomeScreens/Wishlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  static String id = "Home_Screen";

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
         
        }
      },
    );
     FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
    
    super.initState();
  }

  int? currentindex;
  PageController pageController = PageController();
  void ontap(int page) {
    setState(() {
      currentindex = page;
      // print(index);
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Featured_Screen(),
          Search_Page(),
          MyCourses_Screen(),
          WishList(),
          Account_Screen(),
        ],
        onPageChanged: (index) {
          //index=page change karna pe index
          setState(() {
            currentindex = index;
            //  print(currentindex);
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        backgroundColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Color(0xFF333333)),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedFontSize: 15,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFF333333),
        unselectedFontSize: 12,
        currentIndex: currentindex ?? 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Featured"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_video), label: "My Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_outlined), label: "WishList"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account")
        ],
      ),
    );
  }
}
