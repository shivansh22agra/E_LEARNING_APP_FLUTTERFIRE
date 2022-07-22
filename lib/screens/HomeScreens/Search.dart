import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_Page extends StatelessWidget {
  final TextEditingController SearchController = TextEditingController();
//  const Search_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: CupertinoTextField(
          controller: SearchController,
        ),
      ),
    );
  }
}
