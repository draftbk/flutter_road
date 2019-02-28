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




class Day8 extends StatefulWidget {
  @override
  createState() => Day8State();
}


class Day8State extends State<Day8> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.directions_bike),
            ),
            new Tab(
              icon: new Icon(Icons.directions_boat),
            ),
            new Tab(
              icon: new Icon(Icons.directions_bus),
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(child: new Text('自行车')),
          new Center(child: new Text('船')),
          new Center(child: new Text('巴士')),
        ],
      ),
    );
  }


}