import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_leaning_app/screens/Detailed_Screen.dart';
import 'package:e_leaning_app/services/DataContoller.dart';
import 'package:e_leaning_app/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search_Page extends StatefulWidget {
  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  final TextEditingController SearchController = TextEditingController();

//  const Search_Page({Key? key}) : super(key: key);
  QuerySnapshot? snapshotData;

  bool isExcuted = false;
  Widget searchData() {
    return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(Detailed_Screen(),
              transition: Transition.rightToLeftWithFade,
              arguments: snapshotData?.docs[index]);
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(snapshotData?.docs[index]['image']),
              ),
              title: Text(
                snapshotData?.docs[index]["name"],
                style: kstyle,
              ),
            ),
          );
        },
        itemCount: snapshotData?.docs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (value) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    value.queryData(SearchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExcuted = true;
                      });
                    });
                  });
            },
          )
        ],
        backgroundColor: Colors.black,
        title: TextField(
          style: TextStyle(color: Colors.white),
          controller: SearchController,
          decoration: InputDecoration(
            hintText: "Search",
            // labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      body: isExcuted
          ? searchData()
          : Center(
              child: Container(
                child: Text(
                  "Search Courses",
                  style: kstyle,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isExcuted = false;
          });
        },
        child: Icon(Icons.minimize),
      ),
    );
  }
}
