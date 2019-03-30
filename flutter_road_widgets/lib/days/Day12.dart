/**
 * Day 12
 * Test
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

import 'package:test/test.dart';


class Day12 extends StatefulWidget {
  @override
  createState() => Day12State();
}

class Day12State extends State<Day12> {
  String mytext = "Console";
  double buttonWidth = 200;
  String getUrl="https://httpbin.org/ip";
  String postUrl="http://ip.taobao.com/service/getIpInfo.php";
  String searchIp='117.89.35.58';
  void setMyTextState(String newText) {
    setState(() {
      mytext = newText;
    });
  }

  void unitTest()  {

  }





  @override
  Widget build(BuildContext context) {
    Widget asyncSection = Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      height: 400.0,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed:  unitTest,
                child: new Text('Unit Test'),
                color: Color(0xFFe16552),
              ),
            ),
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed: unitTest,
                child: new Text('Widget Test'),
                color: Color(0xFFe16552),
              ),
            ),
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed: unitTest,
                child: new Text('Integration Test'),
                color: Color(0xFFe16552),
              ),
            ),
          ],
        ),
      ),
    );
    Widget consoleSection = Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      height: 300.0,
      width: double.infinity,
      child: Text(
        mytext,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: CupertinoNavigationBar(
          middle: Text('Testing'),
        ),
        body: Column(children: <Widget>[
          asyncSection,
          new Container(
            color: Color(0xFFe16552),
            height: 2,
            width: double.infinity,
          ),
          consoleSection,
        ]));
  }
}
