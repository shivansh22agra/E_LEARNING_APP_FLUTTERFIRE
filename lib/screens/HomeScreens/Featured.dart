import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_leaning_app/screens/Detailed_Screen.dart';
import 'package:e_leaning_app/screens/MyList.dart';
import 'package:e_leaning_app/services/DataContoller.dart';
import 'package:e_leaning_app/utils/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Featured_Screen extends StatefulWidget {
  const Featured_Screen({Key? key}) : super(key: key);

  @override
  State<Featured_Screen> createState() => _Featured_ScreenState();
}

class _Featured_ScreenState extends State<Featured_Screen> {
  List<Icon> icons = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("assets/image.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 80,
                  width: 400,
                  color: Colors.blueAccent,
                  child: Column(
                    children: [
                      Text(
                        "Some Courses are on sale",
                        style: kstyle.copyWith(fontSize: 20),
                      ),
                      Text("1 Day left",
                          style: kstyle.copyWith(
                            fontSize: 22,
                          ))
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Featured",
                style: kstyle.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(
                height: 200,
                width: 400,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                        future: value.getData('top'),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.white),
                            );
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                // int no = snapshot.data?[index]['rating'];
                                // print(no);
                                // for (var i = 1; i <= 4; i++) {
                                //   print(i);
                                //   icons.add(Icon(
                                //     EvaIcons.star,
                                //     color: Colors.yellow,
                                //     size: 20,
                                //   ));
                                //  }
                                return GestureDetector(
                                  onTap:
                                  (){ Get.to(Detailed_Screen(),
                                  arguments: snapshot.data[index],
                                  transition: Transition.cupertino);},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            // color: Color(0xFF333333),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        constraints:
                                            BoxConstraints(maxWidth: 200),
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.network(
                                                  snapshot.data?[index]['image']),
                                            ),
                                            Text(snapshot.data?[index]['name'],
                                                style: kstyle.copyWith(
                                                    fontSize: 20)),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.attach_money_sharp,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  snapshot.data[index]['price']
                                                      .toString(),
                                                  style: kstyle.copyWith(
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                            snapshot.data[index]['bool']
                                                ? Container(
                                                    color: Colors.yellowAccent,
                                                    child: Text(
                                                      "BestSeller",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ))
                                                : Container(),
                                            // Expanded(
                                            //   child: Row(
                                            //    // mainAxisAlignment: MainAxisAlignment.start,
                                            //     children: icons,
                                            //   ),
                                            // )
                                          ],
                                        )),
                                  ),
                                );
                              },
                            );
                          }
                        });
                  },
                )),
            SizedBox(
                height: 200,
                width: 400,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                        future: value.getData('top'),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.white),
                            );
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to( Detailed_Screen(),
                                      arguments: snapshot.data[index],
                                     
                                      transition: Transition.downToUp,
                                    );

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            // color: Color(0xFF333333),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        constraints:
                                            BoxConstraints(maxWidth: 200),
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Image.network(snapshot
                                                    .data?[index]['image'])),
                                            Text(snapshot.data?[index]['name'],
                                                style: kstyle.copyWith(
                                                    fontSize: 20)),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.attach_money_sharp,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  snapshot.data[index]['price']
                                                      .toString(),
                                                  style: kstyle.copyWith(
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                            snapshot.data[index]['bool']
                                                ? Container(
                                                    color: Colors.yellowAccent,
                                                    child: Text(
                                                      "BestSeller",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ))
                                                : Container(),
                                          ],
                                        )),
                                  ),
                                );
                              },
                            );
                          }
                        });
                  },
                )),
          ],
        ),
      ),
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                print("pressed");
                Get.to(MyList());
              },
              icon: Icon(
                EvaIcons.shoppingBag,
                color: Colors.white,
              ),
            )
          ],
          backgroundColor: Colors.black,
          title: Text(
            "Featured Screen",
            style: kstyle,
          )),
    );
  }
}
