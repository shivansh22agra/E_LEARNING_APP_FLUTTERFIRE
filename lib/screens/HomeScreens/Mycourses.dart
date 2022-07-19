import 'package:e_leaning_app/services/DataContoller.dart';
import 'package:e_leaning_app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MyCourses_Screen extends StatefulWidget {
  const MyCourses_Screen({Key? key}) : super(key: key);

  @override
  State<MyCourses_Screen> createState() => _MyCourses_ScreenState();
}

class _MyCourses_ScreenState extends State<MyCourses_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
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
                                return Padding(
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
                                                snapshot.data?[index]['image'],
                                                fit: BoxFit.fitHeight,)
                                                ,
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
                                );
                              },
                            );
                          }
                        });
                  },
                ))
    );
  }
}
