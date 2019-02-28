/**
 * Day 6
 * Dialog
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:flutter_road_widgets/subpage/TopBarPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class Day7 extends StatefulWidget {
  @override
  createState() => Day7State();
}



class Day7State extends State<Day7> {



  PageController pageController;
  int page = 1;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      backgroundColor: Colors.grey[200],

      // 传入
      body: new PageView(
          children: [
            new Scaffold(
            backgroundColor: Colors.grey[200],
              appBar: CupertinoNavigationBar(middle: Text('PageLeft'),),
              body: new Center(child: new Text('PageLeft',style: TextStyle(fontSize: 20,),)),
            ),
            new TopBarPage(),
            new Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: CupertinoNavigationBar(middle: Text('PageRight'),),
            body: new Center(child: new Text('PageRight',style: TextStyle(fontSize: 20,),)),
            ),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
      ),

      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.font),
            title: new Text("Text"),
            backgroundColor: Colors.grey
        ),
        new BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.handPointUp),
            title: new Text("Top"),
            backgroundColor: Colors.grey),
        new BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.image),
            title: new Text("Button"),
            backgroundColor: Colors.grey,
        ),
      ],
          onTap: onTap,
          currentIndex: page
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // 设置初始化page
    pageController = new PageController(initialPage: this.page);
  }


  void onTap(int index) {
    pageController.animateToPage(
        index,
        // 设置页面转换效果的时间
        duration: const Duration(milliseconds: 300),
        // 设置转换时的效果
        curve: Curves.ease);
  }


  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

}