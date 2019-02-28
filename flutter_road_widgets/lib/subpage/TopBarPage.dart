/**
 * Day 6
 * TopBarPage
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class TopBarPage extends StatefulWidget {
  @override
  createState() => TopBarPageState();
}


class TopBarPageState extends State<TopBarPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('TopBarPage'),
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              icon: new Icon(FontAwesomeIcons.google),
            ),
            new Tab(
              icon: new Icon(FontAwesomeIcons.facebook),
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(child: new Text('Google',style: TextStyle(fontSize: 20,),)),
          new Center(child: new Text('Facebook',style: TextStyle(fontSize: 20,),)),
        ],
      ),
    );
  }


}