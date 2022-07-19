import 'package:e_leaning_app/screens/Home_Screen.dart';
import 'package:e_leaning_app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyList extends StatefulWidget {
  static String id = "MyList_Screen";
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF333333),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: Home_Page(), type: PageTransitionType.rotate,alignment: Alignment.topLeft));
          },
        ),
        title: Text(
          "My List",
          style: kstyle,
        ),
      ),
      body: Container(),
    );
  }
}
