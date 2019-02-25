/**
 * Day 6
 * Dialog
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';




class Day6 extends StatefulWidget {
  @override
  createState() => Day6State();
}


class Day6State extends State<Day6> {

  void task2() {
     print("1");
     Navigator.of(context).pop();

  }
  Future<void> _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Ok'))
          ],
        )

    );
  }

  @override
  Widget build(BuildContext context) {

    Widget dialogSection = Builder(
        builder: (context) => Container(
            margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
            height: 500.0,
            child: new Center(
                child:Column(
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: task2,
                      child: new Text('Future.Then'),
                      color: Color(0xFFe16552),
                    ),
                    new RaisedButton(
                      onPressed: ()=>_showAlert(context, 'Do you like flutter, I do!'),
                      child: new Text('AlertDialog'),
                      color: Color(0xFFe16552),
                    ),
                    new RaisedButton(
                      onPressed: task2,
                      child: new Text('SimpleDialog'),
                      color: Color(0xFFe16552),
                    ),
                    new RaisedButton(
                      onPressed: task2,
                      child: new Text('Wait With Other Task'),
                      color: Color(0xFFe16552),
                    ),
                  ],
                )
            )
        )
    );


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('Dialog'),
      ),
      body: Column(
        children:<Widget>[
          dialogSection,          // FloatingActionButton.extended
        ]
      )
    );
  }
}