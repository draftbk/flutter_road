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


class Day7State extends State<Day7> {



  @override
  Widget build(BuildContext context) {

    Widget dialogSection = Builder(
        builder: (context) => Container(
            margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            height: 500.0,
            child: Text("dialog")
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