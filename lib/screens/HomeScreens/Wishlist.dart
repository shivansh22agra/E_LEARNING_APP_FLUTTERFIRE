import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_leaning_app/main.dart';
import 'package:e_leaning_app/screens/MyList.dart';
import 'package:e_leaning_app/utils/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
//import 'package:get/get_connect/sockets/src/sockets_html.dart';
import 'package:page_transition/page_transition.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: MyList(),
                          type: PageTransitionType.leftToRightWithFade));
                },
                icon: Icon(
                  Icons.shop,
                  color: Colors.white,
                ))
          ],
          title: Text(
            "Wishlist",
            style: kstyle,
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Color(0xFF333333),
              ));
            } else {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    DocumentSnapshot Data = snapshot.data!.docs[index];
                    return ListTile(
                      leading: Image.network(Data['image']),
                      title: Text(Data['name'],style: kstyle,),
                      subtitle: Text(Data['detail'],style: kstyle,),
                    );
                   
                  },
                  itemCount: snapshot.data?.docs.length);
            }
          },
          stream: FirebaseFirestore.instance.collection("Wishlist").snapshots(),
        )

        //  body: SingleChildScrollView(
        //   child: Container(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Center(
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: SizedBox(
        //               height: 200,
        //               child: Column(
        //                          mainAxisAlignment: MainAxisAlignment.center,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   CircleAvatar(
        //                     backgroundColor: Color(0xFF333333),
        //                     radius: 30,
        //                     child: Icon(
        //                       EvaIcons.shakeOutline,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Text(
        //                       "Want to save something for later",
        //                       style: TextStyle(
        //                           color: Colors.white,
        //                           fontSize: 25,
        //                           fontWeight: FontWeight.bold),
        //                     ),
        //                   ),
        //                   Text(
        //                     "Your wishlist shall go here",
        //                     style: kstyle,
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //         Divider(
        //           color: Color(0xFF333333),
        //           thickness: 3,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             "Browse  Categories",
        //             style: kstyle.copyWith(fontSize: 20),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             EvaIcons.browserOutline,
        //             color: Color(0xFF333333),
        //           ),
        //           title: Text(
        //             "Finance & Accounting",
        //             style: kstyle.copyWith(fontSize: 15),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             EvaIcons.browserOutline,
        //             color: Color(0xFF333333),
        //           ),
        //           title: Text(
        //             "Development",
        //             style: kstyle.copyWith(fontSize: 15),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             EvaIcons.browserOutline,
        //             color: Color(0xFF333333),
        //           ),
        //           title: Text(
        //             "It and Software",
        //             style: kstyle.copyWith(fontSize: 15),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             EvaIcons.browserOutline,
        //             color: Color(0xFF333333),
        //           ),
        //           title: Text(
        //             "Much More",
        //             style: kstyle.copyWith(fontSize: 15),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
