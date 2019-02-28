/**
 * Day 6
 * Dialog
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';




class Day7 extends StatefulWidget {
  @override
  createState() => Day7State();
}


class PageSection1 extends StatelessWidget {
  String myContent;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child:
        new Text(myContent),
      ),
    );
  }

}
class PageSection2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      body: new Center(
        child:
        new Text("分类"),
      ),
    );
  }
}
class PageSection3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child:
        new Text("分类"),
      ),
    );
  }
}

class Day7State extends State<Day7> {



  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      backgroundColor: Colors.grey,

      body: new PageView(

          children: [
            new PageSection1(),
            new PageSection2(),
            new PageSection3(),
          ],

          controller: pageController,
          onPageChanged: onPageChanged
      ),

      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
            icon: new Icon(Icons.laptop_chromebook),
            title: new Text("主页"),
            backgroundColor: Colors.grey
        ),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.list), title: new Text("分类"),backgroundColor: Colors.grey),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.local_grocery_store), title: new Text("购物车")),
      ],
          onTap: onTap,
          currentIndex: page
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }


  void onTap(int index) {
    pageController.animateToPage(
        index, duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }


  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }


}