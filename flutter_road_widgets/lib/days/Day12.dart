import 'package:flutter/gestures.dart';
/**
 * Day 12
 * Test
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';




class Day12 extends StatefulWidget {
  @override
  createState() => Day12State();
}

class Day12State extends State<Day12> {


  void setMyTextState(String newText) {
    setState(() {
    });
  }







  @override
  Widget build(BuildContext context) {
    Widget asyncSection = Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      height: 400.0,
      child: new Center(
        child: new RichText(
          text: new TextSpan(
            children: [
              new TextSpan(
                text: '测试的项目不适合写在这个项目里，可以查看我写的blog(里面也有代码链接): \n',
                style: new TextStyle(color: Colors.black,fontSize: 22),
              ),
              new TextSpan(
                text: 'https://github.com/draftbk/flutter_road/blob/master/notes/Flutter_Tests.md\n',
                style: new TextStyle(color: Colors.blue,fontSize: 22),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () { launch('https://github.com/draftbk/flutter_road/blob/master/notes/Flutter_Tests.md');
                  },
              ),
              new TextSpan(
                text: '希望对你有帮助<(￣︶￣)>',
                style: new TextStyle(color: Colors.black,fontSize: 22),
              ),
            ],
          ),
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
        ]));
  }
}
