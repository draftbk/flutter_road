/**
 * Day 6
 * Dialog
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

import 'package:flutter_road_widgets/subpage/MySingleChooseDialog.dart';

class Day6 extends StatefulWidget {
  @override
  createState() => Day6State();
}

class Day6State extends State<Day6> {
  double buttonWidth = 200;
  String mytext = "Console";

  void setMyTextState(String newText) {
    setState(() {
      mytext = newText;
    });
  }

  Future<void> _showSnackBar(BuildContext context, String text) async {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Future<void> _showSimpleAlertDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('我是一个简单 Dialog'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('是的'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showListAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('我是一个列表 Dialog'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                  onTap: () {
                    setMyTextState("你点击了: Map");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                  onTap: () {
                    setMyTextState("你点击了: Album");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                  onTap: () {
                    setMyTextState("你点击了: Phone");
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSingleChooseDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MySingleChooseDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget dialogSection = Builder(
        builder: (context) => Container(
            margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
            height: 400.0,
            child: new Center(
                child: Column(
              children: <Widget>[
                new ButtonTheme(
                  minWidth: buttonWidth,
                  child: RaisedButton(
                    onPressed: () =>
                        _showSnackBar(context, '欢迎来到我的 Flutter 博客！'),
                    child: new Text('底部提示框'),
                    color: Color(0xFFe16552),
                  ),
                ),
                new ButtonTheme(
                  minWidth: buttonWidth,
                  child: RaisedButton(
                    onPressed: () => _showSimpleAlertDialog('Flutter 是不是很棒！'),
                    child: new Text('简单 Dialog 提示框'),
                    color: Color(0xFFe16552),
                  ),
                ),
                new ButtonTheme(
                  minWidth: buttonWidth,
                  child: RaisedButton(
                    onPressed: () => _showListAlertDialog(),
                    child: new Text('列表 Dialog 提示框'),
                    color: Color(0xFFe16552),
                  ),
                ),
                new ButtonTheme(
                  minWidth: buttonWidth,
                  child: RaisedButton(
                    onPressed: () => _showSingleChooseDialog(),
                    child: new Text('单选 Dialog 提示框'),
                    color: Color(0xFFe16552),
                  ),
                ),
              ],
            ))));

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
          middle: Text('Dialog'),
        ),
        body: Column(children: <Widget>[
          dialogSection,
          new Container(
            color: Color(0xFFe16552),
            height: 2,
            width: double.infinity,
          ),
          consoleSection,
        ]));
  }
}
