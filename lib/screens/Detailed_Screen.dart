import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_leaning_app/services/VideoPlayer.dart';
import 'package:e_leaning_app/utils/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detailed_Screen extends StatelessWidget {
  const Detailed_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Detailed Screen",
          style: kstyle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              EvaIcons.share,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              EvaIcons.shoppingCartOutline,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                Get.arguments["name"],
                style: kstyle.copyWith(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Get.arguments["detail"],
                  style: kstyle,
                ),
              ),
              Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            Get.arguments["rating"].toString(),
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.black,
                          ),
                          Text(
                            "${Get.arguments["rating"].toString()} by students",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(Scaffold(
                      body: VideoDisplay(videoUrl: Get.arguments["video"])));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    width: 300,
                    child: Stack(children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    Get.arguments["image"],
                                  ))),
                        ),
                      ),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue),
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white,
                            )),
                      )
                    ]),
                  ),
                ),
              ),
              ReusableContainer(
                color: Colors.redAccent,
                text: "Buy Now",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableContainer(
                    text: "Add to Cart",
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () async {
                      FirebaseFirestore.instance.collection("Wishlist").add({
                        "name": Get.arguments["name"],
                        "price": Get.arguments["price"],
                        "image": Get.arguments["image"],
                        "video": Get.arguments["video"],
                        "rating": Get.arguments["rating"],
                        "detail": Get.arguments["detail"],
                      }).whenComplete(() {
                        Get.snackbar('Hurray',
                            '${Get.arguments["name"]} is added to the Wishlist',colorText: Colors.white,
                            backgroundColor: Color(0xFF333333));
                      });
                    },
                    child: ReusableContainer(
                      text: "Add to Wishlist",
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  String? text;
  Color? color;
  ReusableContainer({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 100,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)
                // border: Border.all(color: Colors.white),
                ),
        child: Center(
          child: Text(
            text!,
            style: kstyle,
          ),
        ),
      ),
    );
  }
}
