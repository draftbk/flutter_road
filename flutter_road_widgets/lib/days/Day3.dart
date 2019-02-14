/**
 * Day 2
 * Button
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';


class Day3 extends StatefulWidget {
  @override
  createState() => Day3State();
}

class Day3State extends State<Day3> {

  int groupValue1,groupValue2;
  @override
  Widget build(BuildContext context) {

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      child: Column(
        children: [
          // Image from internet
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Image.network(
              'https://picsum.photos/250?image=1',
               scale: 0.5,
            ),
          ),
          // Image from internet
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child:Image.network(
              'https://picsum.photos/250?image=1',
              scale: 0.5,
            ),
          )


        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('Image'),
      ),
      body: buttonSection,

    );
  }
}