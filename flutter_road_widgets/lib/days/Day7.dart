/**
 * Day 6
 * Dialog
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:flutter_road_widgets/days/Day1.dart';
import 'package:flutter_road_widgets/days/Day2.dart';
import 'package:flutter_road_widgets/days/Day3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class Day7 extends StatefulWidget {
  @override
  createState() => Day7State();
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
            new Day1(),
            new Day2(),
            new Day3(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged
      ),

      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.font),
            title: new Text("Text"),
            backgroundColor: Colors.grey
        ),
        new BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.toggleOff),
            title: new Text("Button"),
            backgroundColor: Colors.grey),
        new BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.image),
            title: new Text("Image"),
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